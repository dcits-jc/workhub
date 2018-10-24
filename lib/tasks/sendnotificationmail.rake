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
        # send_users = t.teamusers.pluck(:email)
        send_users = ['zhangyingab@dcits.com']
        # binding.pry
        # 把该下载链接发送给该部门联系人
        download_link = 'http://daily.dcits.com/teams/team_weekly_download.xls?start_date=' + start_date.strftime('%Y-%m-%d')+'&end_date='+end_date.strftime('%Y-%m-%d')+'&team_id='+t.id.to_s

        # 文件名
        file_name = t.name+"周报("+start_date.strftime('%Y-%m-%d')+"~"+end_date.strftime('%Y-%m-%d')+").xls"
        # 现在发送
        # binding.pry
        if !send_users.empty?
          UserMailer.weekly_summary(send_users,download_link,file_name,start_date,end_date).deliver_now
          puts '已发送!'
        end
        # # 如果当前团队有子团队
        # team_arrary = [t.id]
        # # 把子团队加进来
        # t.children.each do |c|
        #   team_arrary.push(c)
        # end

        # # 先检索出这段时间该团队所有的 feeds endtime
        # team_feeds = Feed.includes(:user).where( users: { team_id: team_arrary },feeds: { end_time: start_date..end_date })
        # feeds = team_feeds.order("feeds.created_at ASC")

        # # 全部该团队的用户
        # feeded_users =  t.members

        # # 建立 xlsx
        # book = Spreadsheet::Workbook.new
        # sheet1 = book.create_worksheet :name => '报工明细'
        # sheet1.row(0).replace ["项目号",
        #                       "项目名",
        #                       "项目类型",
        #                       "项目状态",
        #                       "项目所属部门",
        #                       "销售当前部门",
        #                       "销售",
        #                       "项目经理",
        #                       "报工人事业部",
        #                       "报工人所属SBU",
        #                       "报工人",
        #                       "工作类型",
        #                       "工作内容描述",
        #                       "涉及厂商",
        #                       "技术方向",
        #                       "工作量(小时)",
        #                       "开始时间",
        #                       "结束时间",
        #                       "提交时间"]
        # i = 0
        # feeds.each do |feed|
        #   i+=1
        #   # 管理员序列
        #   manager_arrary =[]
        #   if feed.feedable.project.managers.present?
        #     feed.feedable.project.managers.each do |m|
        #       manager_arrary.push(m.name)
        #     end
        #   end
        #   # 厂商序列
        #   itvendors_arrary =[]
        #   if feed.feedable.tag_itvendors.present?
        #     feed.feedable.tag_itvendors.each do |v|
        #       itvendors_arrary.push(v.name)
        #     end
        #   end
        #   # 结束方向序列
        #   itskills_arrary =[]
        #   if feed.feedable.tag_itskills.present?
        #     feed.feedable.tag_itskills.each do |s|
        #       itskills_arrary.push(s.name)
        #     end
        #   end
        #   # 确认是否启用
        #   enabled_tag = feed.feedable.project.enabled? ? '启用' : '禁用'
        #   # 项目是否绑定团队
        #   project_binding_team = feed.feedable.project.binding_team.present? ? feed.feedable.project.binding_team.name : nil
        #   # 母 sub 是否存在
        #   user_sbu = feed.user.team.parent.present? ? feed.user.team.parent.name : nil

        #   sheet1.row(i).replace [feed.feedable.project.code,
        #     feed.feedable.project.name,
        #     desc_projecttype(feed.feedable.project.projecttype),
        #     enabled_tag,
        #     project_binding_team,
        #     feed.feedable.project.sales.team.name,
        #     feed.feedable.project.sales.name,
        #     manager_arrary.join(','),
        #     feed.user.team.name,
        #     user_sbu,
        #     feed.user.name,
        #     desc_worktype(feed.feedable.worktype),
        #     ActionController::Base.helpers.strip_tags(feed.feedable.content),
        #     itvendors_arrary.join(','),
        #     itskills_arrary.join(','),
        #     feed.feedable.hours,
        #     strf(feed.feedable.begin_time),
        #     strf(feed.feedable.end_time),
        #     strf(feed.created_at)]
          
        # end


        # # 统计信息表
        # sheet2 = book.create_worksheet :name => '统计信息'
        # sheet2.row(0).replace ["用户名",
        #                       "部门",
        #                       "是否提交周报",
        #                       "总工作量(h)",
        #                       "饱和度(%)"]
        # i = 0
        # feeded_users.each do |u|
        #   i+=1
        #   user_submit_tag = user_feed_submit?(u,start_date,end_date) ? '是' : '否'
        #   sheet2.row(i).replace [u.name,
        #                 u.team.name,
        #                 user_submit_tag,
        #                 u.time_workloads(start_date,end_date),
        #                 u.time_workloads_precent(start_date,end_date)]
        # end

        
        # file_url = "tmp/excel_emails/"+ file_name
        # # 写入文件
        # binding.pry
        # book.write file_url 
        # binding.pry

        
      end
    end
      
  end
end
