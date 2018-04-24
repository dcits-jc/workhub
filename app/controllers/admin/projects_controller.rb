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
    # 记录创建者
    @project.builder = current_user
    # 加入这个创建者
    @project.join!(current_user)
    if @project.save
      flash[:notice] = "项目建立成功!"
      redirect_to admin_projects_path
    else
      flash[:alert] = "项目建立失败!"
      render :new
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



  private

  def project_params
    params.require(:project).permit(:name, :description,:new_member,:new_manager)
  end

end
