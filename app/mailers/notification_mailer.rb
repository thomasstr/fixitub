class NotificationMailer < ActionMailer::Base
  default :from => "no-reply@fixitub.no"
  default :to => "fixitub.svgs@gmail.com"
  
  def new_message(message)
    @message = message
    mail(:subject => "[FixIt UB] #{message.subject}")
  end
  
end
