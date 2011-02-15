class AdminController < ApplicationController
  #before_filter :authenticate_admin
  
  def users
    @users = User.find(:all, :order => "full_name")
  end
  
  def make_user_admin
    @user = User.find(params[:id])
    @user.is_admin = 1
    @user.save
    redirect_to admin_users_path
  end
  
end
