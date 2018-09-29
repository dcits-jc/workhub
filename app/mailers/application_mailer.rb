class ApplicationMailer < ActionMailer::Base
  default from: "Daily <daily@dcits.com>"
  layout 'mailer'
end
