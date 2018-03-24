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

 # 时间格式化
 def strf(time)
  if time.present?
    time.strftime('%Y/%m/%d')
  else
    nil
  end 
 end


 # 时间格式化
 def strf_pickr(time)
  if time.present?
    time.strftime('%Y-%m-%d')
  else
    nil
  end 
 end

 # 时间格式化
 def strf_detail(time)
  if time.present?
    time.strftime('%Y/%m/%d')
  else
    nil
  end 
 end

 # 时间戳的周起始时间
 def week_begin(time_cur)
   time_cur.at_beginning_of_week.strftime('%Y/%m/%d')
 end

 # 时间戳的周结束时间
 def week_end(time_cur)
   time_cur.at_end_of_week.strftime('%Y/%m/%d')
 end


end
