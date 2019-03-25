# require "#{Rails.root}/app/helpers/application_helper"
# include ApplicationHelper


namespace :sendnotificationmail do

  # 用于发送各部门总结附件邮件邮件给各部门负责人
  desc "send feeds to manager"
  task :sendfeeds2manager => :environment do
    # require 'rubygems'
    # require 'simple_xlsx'
    # 遍历所有部门(bu级别)
    Team.no_parents.each do |t|
      # 必须无父部门,且有子部门
      if t.has_children?
        # 每个部门都导出excel版本的feeds        

        # 设置上周时间区间
        lastweek_time = Time.now - 7.days
        # 找到上周的这个时间
        start_date = lastweek_time.at_beginning_of_week
        end_date = lastweek_time.at_end_of_week


        # 遍历该 bu 的联系人
        send_users = t.teamusers.pluck(:email)
        # binding.pry
        # 把该下载链接发送给该部门联系人
        # download_link = 'http://daily.dcits.com/teams/team_weekly_download.xls?start_date=' + start_date.strftime('%Y-%m-%d')+'&end_date='+end_date.strftime('%Y-%m-%d')+'&team_id='+t.id.to_s

        download_link = 'http://117.78.48.207/teams/team_weekly_download.xls?start_date=' + start_date.strftime('%Y-%m-%d')+'&end_date='+end_date.strftime('%Y-%m-%d')+'&team_id='+t.id.to_s

        # 文件名
        file_name = t.name+"周报("+start_date.strftime('%Y-%m-%d')+"~"+end_date.strftime('%Y-%m-%d')+").xls"
        # 现在发送
        # binding.pry
        if !send_users.empty?
          UserMailer.weekly_summary(send_users,download_link,file_name,start_date,end_date).deliver_now
          puts '已发送!'
        end
        
      end
    end 
  end
end




