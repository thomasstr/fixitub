# encoding: utf-8
class ContactController < ApplicationController
  
  def new
      @message = Message.new
    end

    #def create
    #  @message = Message.new(params[:message])
      
    #  if @message.valid?
    #    NotificationsMailer.new_message(@message).deliver
        #NotificationMailer.deliver_new_message params[:message]
    #    redirect_to(root_path, :notice => "Meldingen ble sendt! Du hører fra oss snart!")
    #  else
    #    flash.now.alert = "Fyll ut alle felter."
    #    render :new
    #  end
    #end
    def create
      @message = Message.new(params[:message])
      if @message.valid?
        # TODO send message here
        NotificationMailer.new_message(@message).deliver
        flash[:notice] = "Melding sendt! Du hører snart fra oss!"
        redirect_to root_url
      else
        render :action => 'new'
      end
    end
    
end