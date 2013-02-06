class NotificationMailer < ActionMailer::Base
  default from: "fixitub.svgs@gmail.com"
  default to: "fixitub.svgs@gmail.com"
  
  def new_message(message)
    @message = message
    mail(:subject => "[FixIt UB] #{message.subject}")
  end
end
