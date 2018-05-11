class Admin::UsersController < ApplicationController
  layout 'admin'
  # 需要管理员权限
  before_action :require_is_admin

  def index
    @all_users = User.all
    # 用户搜索
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 20)
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
    @user.name = user_params[:name].strip
    @user.code = user_params[:code].strip
    @user.password = ENV["user_default_password"]
    @user.password_confirmation = ENV["user_default_password"]
    code_user = User.find_by_code(@user.code)
    # 如果用户已经存在
    if code_user.present?
      flash[:alert] = "昵称已存在!"
      render :new
    else
      # binding.pry
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
    @user.password_resetting = true
    if @user.save
      flash[:notice] = "用户密码重置成功!"
      redirect_to admin_user_path(@user)
    else
      flash[:alert] = "用户密码重置失败!"
      redirect_to admin_user_path(@user)
    end
  end

  # 设置为管理员
  def set_admin
    @user = User.find(params[:id])
    @user.set_admin!
    redirect_to admin_users_path
  end


  # 取消管理员
  def cancel_admin
    @user = User.find(params[:id])
    @user.cancel_admin!
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:code,:itcode,:email,:level,:title,:cost,:avatar_attachment,:password_resetting,:team_id,:resume_attachment,:idcard_attachment,:degree_attachment,:academic_attachment,:degree,:extra_cost,:is_feedneeded)
  end
  

end
