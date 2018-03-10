class Admin::UsersController < ApplicationController

  layout 'admin'

  def index
    @users = User.all
  end

  def show
    @user = User.includes(:team).find(params[:id])
    @participated_projects = @user.participated_projects
  end

  def edit
    @user = User.includes(:team).find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = ENV["user_default_password"]
    @user.password_confirmation = ENV["user_default_password"]
    code_user = User.find_by_code(user_params[:code])
    # 如果用户已经存在
    if code_user.present?
      flash[:alert] = "昵称已存在!"
      render :new
    else
      if @user.save
        flash[:notice] = "用户建立成功!"
        redirect_to admin_users_path
      else
        flash[:alert] = "用户建立失败!"
        render :new
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "用户更新成功!"
      redirect_to admin_users_path
    else
      flash[:alert] = "用户更新失败!"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "用户已删除"
    redirect_to admin_users_path
  end


  # 重置密码
  def reset_password
    @user = User.find(params[:id])
    @user.password = ENV["user_default_password"]
    if @user.save
      flash[:notice] = "用户密码重置成功!"
      redirect_to admin_user_path(@user)
    else
      flash[:alert] = "用户密码重置失败!"
      redirect_to admin_user_path(@user)
    end
  end



  private

  def user_params
    params.require(:user).permit(:name,:code,:email,:avatar_attachment,:password_resetting,:team_id)
  end
  

end
