class ProjectsController < ApplicationController

  layout 'user'
  def index
    @projects = current_user.participated_projects
    # binding.pry
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

      # 如果不是临时项目,而且不是12位
      if project_params[:projecttype]!='sipresale_project' and check_code?(project_params[:code]) == false
        # binding.pry
        flash[:alert] = "项目号格式有误,请填写正确的12位项目号(其中字母必须为大写)!"
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
        redirect_to project_path(@project)
      else
        flash[:alert] = "新增成员失败!"
        redirect_to project_path(@project)        
      end

    # 如果是增加管理员就只增加管理员
    elsif project_params[:new_manager].present?
      user = User.find(project_params[:new_manager])
      if @project.join_manager!(user)
        flash[:notice] = "新增管理员成功!"
        redirect_to project_path(@project)
      else
        flash[:alert] = "新增管理员失败!"
        redirect_to project_path(@project)        
      end

    # 如果都没增加就是更新其他
    else
      if @project.update(project_params)
        flash[:notice] = "项目更新成功!"
        redirect_to projects_path
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
    redirect_to projects_path
  end


  private

  def project_params
    params.require(:project).permit(:name, :description,:projecttype,:code,:sales_id,:new_member,:new_manager,:pm_id,:project_class,:customer_name,:customer_contact_name,:customer_contact_phone,:customer_contact_email,:area,:begin_time,:end_time)
  end


  # 检查是否项目号是12位
  def check_code?(code)
    if code.present?
      if Project.find_by_code(code).present?
        return false
      # 正则匹配字母或者数字
      elsif code.length == 12 and code =~ /^[A-Z0-9]+$/
        return true
      else
        return false
      end
    else
      return false
    end
  end


end
