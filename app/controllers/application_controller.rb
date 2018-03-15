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



  # 发送信息
  def feed_create!(feedable,user)
    Feed.create(feedable_id: feedable.id, feedable_type: feedable.class,user_id: user.id)
  end


  # 周遍历
  def weekindex(time_end,time_begin)
    # 建立一个周列表
    week_list = []
    # 将时间指针设置成最后时间
    time_cur = time_end
    # 当指针的周起始时间 在 初始时间之后
    while time_cur.at_beginning_of_week > time_begin
      # 就将该指针加入周列表
      week_list << time_cur
      # 并向前再推一周
      time_cur = time_cur - 1.week
    end
    # 最后把初始时间加入指针列表
    week_list << time_begin
    # 最后把当前时间从列表取出,保证只有历史周记录
    # week_list.delete(time_end)
    week_list
  end


end
