class OrganizationsController < ApplicationController
  inherit_resources
  
  def index
    @organizations = Organization.paginate :page => params[:page], :conditions => {:status => "published"}, :order => 'name', :per_page => 20
    index!
  end
  
  def show
    @organization = Organization.find(params[:id])
    #@data_sets = @organization.published_data_set
    @data_sets = @organization.data_sets.paginate :page => params[:page], :conditions => {:status => "published"}, :order => 'data_sets.created_at desc', :per_page => 20
    show!
  end
  
  def search
    @search = DataSet.search { keywords 'water' }
    @data_sets  = @search.results
  end
  
  protected

  def collection
    @organizations ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
