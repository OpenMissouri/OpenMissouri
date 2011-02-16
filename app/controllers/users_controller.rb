class UsersController < ApplicationController
  inherit_resources
  before_filter :authenticate_admin #, {:only => [:new, :edit, :destroy]}
  
  protected

  def collection
    @users ||= end_of_association_chain.paginate(:page => params[:page])
  end

end
