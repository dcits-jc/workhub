class Admin::ProjectsController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin

  def index
    @all_projects = Project.all.order_by_recent
    # 项目搜索
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true).order_by_recent.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @project = Project.find(params[:id])
    @members = @project.members
    @managers = @project.managers
    
    # 历史周
    @history_weeks = weekindex(Time.now, @project.created_at)
    
    # binding.pry
    @feeds =[]
    # 核算总计工时
    @project_workflows_hoursum = 0
    # 合计总计发生成本
    @project_workflows_costsum = 0
    @project.project_workflows.each do |w|
      @feeds.unshift(w.feed)
      @project_workflows_hoursum = @project_workflows_hoursum + w.hours
      @project_workflows_costsum = @project_workflows_costsum + w.cost
    end


    # 导出的数据
    @export_feeds = @feeds

    # 数据导出
    respond_to do |format|
      format.html
      format.xls{ 
        # 设置文件名
        headers["Content-Disposition"]="attachment; filename=工作量导出("+@project.name+"#"+@project.code+").xls"
      }  
    end

  end

  def edit
    @project = Project.find(params[:id])
    @members = @project.members
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    # binding.pry
    # 搜索项目经理
    if project_params[:pm_id].blank? or project_params[:sales_id].blank?
      flash[:alert] = "请选择项目经理与销售!"
      render :new        
    else
      pm_user = User.find(@project.pm_id)
      sales_user = User.find(@project.sales_id)
      @project.pm_id = nil
      # 记录创建者
      @project.builder = current_user


      # 如果 不是售前项目 并且 项目号检查不合格 则提示
      
      if project_params[:projecttype]!='sipresale_project' and check_code?(project_params[:code]) == false
        # binding.pry
        flash[:alert] = "项目号格式有误,请填写正确的10位项目号(其中字母必须为大写)!"
        render :new
      # 如果是 售前项目 并且项目号不为空,但检查格式有问题,也提示
      elsif project_params[:projecttype]=='sipresale_project' and project_params[:code].present? and check_code?(project_params[:code]) == false
        flash[:alert] = "项目号格式有误,请填写正确的10位项目号(其中字母必须为大写)!"
        render :new  
      elsif @project.save

        # 销售加进项目
        @project.join!(sales_user)
        # 也加入 pm
        @project.join!(pm_user)
        # 加入这个创建者
        @project.join!(current_user)

        # 同时将项目经理设置成项目经理
        @project.join_manager!(pm_user)

        flash[:notice] = "项目建立成功!"
        redirect_to projects_path
      else
        flash[:alert] = "项目建立失败!"
        render :new
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    # 如果是增加成员就只增加成员
    if project_params[:new_member].present?
      user = User.find(project_params[:new_member])
      if @project.join!(user)
        flash[:notice] = "新增成员成功!"
        redirect_to admin_project_path(@project)
      else
        flash[:alert] = "新增成员失败!"
        redirect_to admin_project_path(@project)        
      end

    # 如果是增加管理员就只增加管理员
    elsif project_params[:new_manager].present?
      user = User.find(project_params[:new_manager])
      if @project.join_manager!(user)
        flash[:notice] = "新增管理员成功!"
        redirect_to admin_project_path(@project)
      else
        flash[:alert] = "新增管理员失败!"
        redirect_to admin_project_path(@project)        
      end

    # 如果都没增加就是更新其他
    else
      if @project.update(project_params)
        flash[:notice] = "项目更新成功!"
        redirect_to admin_projects_path
      else
        flash[:alert] = "项目更新失败!"
        render :edit
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "项目已删除"
    redirect_to admin_projects_path
  end

  # 禁用项目报工
  def set_disabled
    @project = Project.find(params[:id])
    @project.disabled!
    redirect_to admin_project_path(@project)
  end

  # 启用项目报工
  def set_enabled
    @project = Project.find(params[:id])
    @project.enabled!
    redirect_to admin_project_path(@project)
  end

  # 导入项目操作
  def import
    # 导入文件参数
    excel_file = params[:file]
    begin
      # 打开文件
      spreadsheet = Roo::Spreadsheet.open(excel_file.path)
      header = spreadsheet.row(1)
      # binding.pry
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        # binding.pry
        project = Project.find_by(code: row["项目号"]) || Project.find_by(name: row["项目名称"]) || Project.new
        project.code = row["项目号"]
        project.name = row["项目名称"]
        # project.project_class = row["项目级别"]
        project.projecttype = project_type_choice(row["项目类型"])
        project.sales =  User.find_by_itcode(row["销售员ITCODE"])
        project.binding_team = Team.find_by_name(row["销售事业部"])
        project.builder = current_user
        project.begin_time = row['项目开始日期']
        project.end_time = row['项目结束日期']
        # binding.pry
        project.save
        # 如果项目经理存在,则导入
        if User.find_by_itcode(row['项目经理ITCODE']).present?
          u = User.find_by_itcode(row['项目经理ITCODE'])
          if !project.managers.include?(u)
            project.managers << u
          end
          if !project.members.include?(u)
            project.members << u
          end
        end
        # 销售存在
        if User.find_by_itcode(row['销售员ITCODE']).present?
          u = User.find_by_itcode(row['销售员ITCODE'])
          if !project.members.include?(u)
            project.members << u
          end
        end

      end
      redirect_to admin_projects_path, notice: '项目导入成功.'
    rescue Exception => e
      redirect_to admin_projects_path, alert: '项目导入失败.'
    end

  end

  private

  def project_params
    params.require(:project).permit(:name, :description,:projecttype,:code,:sales_id,:new_member,:new_manager,:pm_id,:project_class,:customer_name,:customer_contact_name,:customer_contact_phone,:customer_contact_email,:area,:begin_time,:end_time,:binding_team_id)
  end

  # 检查是否项目号是12位
  def check_code?(code)
    if code.present?
      if Project.find_by_code(code).present?
        return false
      # 正则匹配字母或者数字
      elsif code.length == 10 and code =~ /^[A-Z0-9]+$/
        return true
      else
        return false
      end
    else
      return false
    end
  end



end
