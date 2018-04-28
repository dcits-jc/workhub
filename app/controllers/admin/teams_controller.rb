class Admin::TeamsController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin

  def index
    @all_teams = Team.all
    # 团队搜索
    @q = Team.ransack(params[:q])
    @teams = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 20).order_by_name
  end

  def show
    @team = Team.find(params[:id])
    @members = @team.users
    @managers = @team.managers
  end

  def edit
    @team = Team.find(params[:id])
    @members = @team.users
  end



  def new
    @team = Team.new
  end


  def create
    @team = Team.new(team_params)
    if @team.save
      # 同时建立相关的部门项目
      @team.create_binding_managementprojects!(current_user)
      flash[:notice] = "团队建立成功!"
      redirect_to admin_teams_path
    else
      flash[:alert] = "团队建立失败!"
      render :new
    end
  end

  def update
    @team = Team.find(params[:id])
    
    # 如果是增加成员就只增加成员
    if team_params[:new_member].present?
      user = User.find(team_params[:new_member])
      if @team.join!(user)
        flash[:notice] = "新增成员成功!"
        redirect_to admin_team_path(@team)
      else
        flash[:alert] = "新增成员失败!"
        redirect_to admin_team_path(@team)        
      end
    # 如果是增加负责人就只增加负责人
    elsif team_params[:new_manager].present?
      user = User.find(team_params[:new_manager])
      if @team.join_manager!(user)
        flash[:notice] = "新增负责人成功!"
        redirect_to admin_team_path(@team)
      else
        flash[:alert] = "新增负责人失败!"
        redirect_to admin_team_path(@team)        
      end
    # 如果不是,则是正常更新
    else
      if @team.update(team_params)
        flash[:notice] = "团队更新成功!"
        redirect_to admin_team_path(@team)
      else
        flash[:alert] = "团队更新失败!"
        render :edit
      end
    end


  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    flash[:notice] = "团队已删除"
    redirect_to admin_teams_path
  end


  # 移除父团队
  def delete_parents
    @team = Team.find(params[:id])
    @parent_team = Team.find(params[:parent_id])
    @team.parent = nil
    @team.save
    flash[:notice] = "该上级部门移除成功!"
    redirect_to admin_team_path(@team)
  end

  # 移除子团队
  def delete_children
    @team = Team.find(params[:id])
    @children_team = Team.find(params[:children_id])
    @team.children.delete(@children_team)
    flash[:notice] = "该下级部门移除成功!"
    redirect_to admin_team_path(@team)
  end


  private

  def team_params
    params.require(:team).permit(:name, :description,:new_member,:new_manager,:parent_id)
  end
  


end
