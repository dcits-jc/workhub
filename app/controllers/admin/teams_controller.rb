class Admin::TeamsController < ApplicationController
  layout 'admin'

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @members = @team.users
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
      if @team.add_member!(user)
        flash[:notice] = "新增成员成功!"
        redirect_to admin_team_path(@team)
      else
        flash[:alert] = "新增成员失败!"
        redirect_to admin_team_path(@team)        
      end

      # render :show
    # 如果不是,则是正常更新
    else
      if @team.update(team_params)
        flash[:notice] = "团队更新成功!"
        redirect_to admin_teams_path
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


  private

  def team_params
    params.require(:team).permit(:name, :description,:new_member)
  end
  


end
