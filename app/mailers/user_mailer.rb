class UserMailer < ApplicationMailer
  # 默认发件人
  default :from => "Daily <daily@dcits.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #
  #
  # 提交周报提示销售
  def notify_sales(send_user,workflow,project)
    @workflow = workflow
    @project = project
    @send_user = send_user
    @to_user = @project.sales
    mail(to: @to_user.email, subject: @send_user.name + " 提交了一条工作记录..")
  end


  # 每一凌晨发送邮件给各 sbu 负责人
  def weekly_summary(send_users,download_link,file_name,start_date,end_date)
    t0 = start_date.strftime('%Y-%m-%d')
    t1 = end_date.strftime('%Y-%m-%d')
    @to_user = send_users
    @download_link = download_link
    @file_name = file_name
    # 找到对应的附件文件
    mail(to: @to_user, subject: "[Daily]上周部门工作统计情况("+t0+"~"+t1+")")
  end


  # # 每一凌晨发送邮件给各 sbu 负责人(带附件)
  # def weekly_summary(send_users,export_feeds,feeded_users,file_name,start_date,end_date)
  #   t0 = start_date.strftime('%Y-%m-%d')
  #   t1 = end_date.strftime('%Y-%m-%d')

  #   @to_user = send_users

  #   @file_name = file_name

  #   # xls 内包含的数据
  #   @start_date = start_date
  #   @end_date = end_date
  #   @export_feeds = export_feeds
  #   @feeded_users = feeded_users

  #   attachments["Daily("+@start_date.strftime('%Y-%m-%d')+"~"+@end_date.strftime('%Y-%m-%d')+").xls"] = 
  #   # 找到对应的附件文件
  #   mail(to: @to_user, subject: "[Daily]上周部门工作统计情况("+t0+"~"+t1+")") do |format|
  #     format.html { render }
  #     format.xls {
  #       attachments["Daily("+@start_date.strftime('%Y-%m-%d')+"~"+@end_date.strftime('%Y-%m-%d')+").xls"]
  #       # 设置文件名 
  #       # headers["Content-Disposition"]="attachment; filename=Daily("+@start_date.strftime('%Y-%m-%d')+"~"+@end_date.strftime('%Y-%m-%d')+").xls"
  #     }
  #   end
  # end


end
