module ApplicationHelper
  
  # 头像生成器
  def user_avatar(user, options = {})
    # 如果用户没有头像,就生成一个,有的话就用自带的
    if user.avatar_attachment_url.nil?
      image_tag user.avatar_url, options
    else
      image_tag user.avatar_attachment_url, options
    end
  end

 # link_to 按钮动态 active
 def active_class(controller_name)
  controller.controller_name == controller_name ? "active" : ""
 end


end
