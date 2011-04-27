class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  before_filter :build_footer_links
  
  
  def build_footer_links
     @terms_links = Page.find(:all, :conditions => "section = 'terms'", :order => "sort")
     @privacy_links = Page.find(:all, :conditions => "section = 'privacy'", :order => "sort")
  end
  
  def authenticate_admin
    unless user_signed_in? and current_user.admin?
      flash[:error] = "Seriously, whoa. You need to be an administrator to do that (at least that's what this computer is telling me)."
      redirect_to root_path 
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
