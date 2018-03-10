class Admin::ProjectsController < ApplicationController
  layout 'admin'

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @members = @project.members
    @managers = @project.managers
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
      flash[:notice] = "团队建立成功!"
      redirect_to admin_projects_path
    else
      flash[:alert] = "团队建立失败!"
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
        flash[:notice] = "团队更新成功!"
        redirect_to admin_projects_path
      else
        flash[:alert] = "团队更新失败!"
        render :edit
      end
    end


  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "团队已删除"
    redirect_to admin_projects_path
  end


  private

  def project_params
    params.require(:project).permit(:name, :description,:new_member,:new_manager)
  end
  






end
