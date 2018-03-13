class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # 强制登录重定向
  before_action :authenticate_user! 


  # 用户登陆后重定向到修改密码页面
  def after_sign_in_path_for(resource_or_scope)
    if current_user.password_resetting == true
      current_user.password_resetting = false
      current_user.save
      edit_user_registration_path
    else
      root_path
    end
  end
  


  # 判断管理员
  def require_is_admin
    if current_user.is_admin == false
      flash[:alert] = '您不是管理员'
      redirect_to root_path
    end
  end


end
