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

end
