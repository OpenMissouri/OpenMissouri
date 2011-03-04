class OrganizationsController < ApplicationController
  inherit_resources
  
  def index
    @organizations = Organization.paginate :page => params[:page], :conditions => {:status => "published"}, :order => 'name', :per_page => 20
    index!
  end
  
  def show
    @organization = Organization.find(params[:id])
    #@data_sets = @organization.published_data_sets
    show!
  end
  
  protected

  def collection
    @organizations ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
