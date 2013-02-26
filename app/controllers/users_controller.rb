class UsersController < ApplicationController
  before_filter :authenticate_user!
  #before_filter :only_allow_admin, :only => [ :index ]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    authorize! :update, @user, :message => "Not authorized as an administrator."
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
  
  def destroy
    authorize! :update, @user, :message => "Not authorized as an administrator."
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
  
  private
  
  def only_allow_admin
    redirect_to root_path, :alert => "Not authorized as an administrator." unless current_user.has_role? :admin
  end
  
end
