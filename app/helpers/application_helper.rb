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

 # link_to 历史按钮动态 active
 def active_history(start_date,end_date)
  current_startdate = params['start_date']
  current_enddate = params['end_date']
  # binding.pry
  if current_startdate == start_date.to_s and current_enddate == end_date.to_s
    "active"
  else
    ""
  end
  # current_startdate == start_date and current_enddate == end_date ? "active" : ""
 end


 # 时间格式化
 def strf(time)
  if time.present?
    time.strftime('%Y/%m/%d')
  else
    nil
  end 
 end

 # 细节时间
 def strf_details(time)
  if time.present?
    time.strftime('%Y/%m/%d %H:%M')
  else
    nil
  end 
 end

 # 带周提示
 def strf_wday(time)
  if time.present?
    case time.wday
    when 0
      wday = '周日'
    when 1
      wday = '周一'
    when 2
      wday = '周二'
    when 3
      wday = '周三'
    when 4
      wday = '周四'
    when 5
      wday = '周五'
    when 6
      wday = '周六'
    end
    time.strftime('%Y/%m/%d ' + wday)
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


 # feed显示工作类型对应
 def desc_worktype(worktype)
  case worktype
  when 'pre_sale'
    '售前'
  when 'in_sale'
    '售中'
  when 'after_sale'
    '售后'
  when 'supply_service'
    '供货'
  when 'single_service'
    '单次服务'
  when 'si_service'
    '集成'
  when 'technical_exchange'
    '厂商交流'
  when 'certification_exam'
    '认证考试'
  when 'tech_improvement'
    '技术提升'
  when 'team_work'
    '部门工作'
  when 'day_off'
    '休假'
  end
 end

 # feed显示项目类型编号
 def desc_projecttype(projecttype)
  case projecttype
  when 'temp_project'
    '临时项目'
  when 'si_project'
    '集成'
  when 'sipresale_project'
    '集成售前'
  when 'supply_project'
    '供货'
  when 'solutionpresale_project'
    '解决方案售前'
  when 'singleservice_project'
    '单次服务'
  when 'operation_project'
    '运维'
  when 'technical_exchange'
    '厂商交流'
  when 'certification_exam'
    '认证考试'
  when 'tech_improvement'
    '技术提升'
  when 'team_work'
    '部门工作'
  when 'day_off'
    '休假'
  else
    '其他类型'
  end
 end


 # 生成七牛私库 url
 def quniuurl_pri(file_url)
   Qiniu::Auth.authorize_download_url(file_url)
 end


 # 生成七牛私库 url
 def user_check_uploadfile(file)
   if file.present?
     content_tag(:td,'√',class: 'alert-success text-center' )
   else
     content_tag(:td,'X',class: 'alert-danger text-center' )
   end
 end



 # 某用户在指定时间内是否有提交周报
 def user_feed_submit?(user,start_date,end_date)
   collect_feeds = user.feeds.where(end_time: start_date..end_date)
   return collect_feeds.present?
 end


end
