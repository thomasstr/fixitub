# encoding: utf-8
class ContactController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Meldingen din ble sendt! Du hører snart fra oss!")
    else
      flash.now.alert = "Vennligst fyll ut alle felt!"
      render :new
    end
  end
end