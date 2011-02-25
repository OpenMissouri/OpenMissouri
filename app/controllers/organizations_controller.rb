class OrganizationsController < ApplicationController
  inherit_resources
  
  def index
    @organizations = Organization.paginate :page => params[:page], :conditions => {:status => "published"}, :order => 'name', :per_page => 20
    index!
  end
  
  protected

  def collection
    @organizations ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
