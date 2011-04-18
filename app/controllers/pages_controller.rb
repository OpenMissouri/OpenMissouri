class PagesController < ApplicationController
  inherit_resources
  before_filter :build_section_pages
  
  def build_section_pages
    @page_links = Page.find(:all, :conditions => "section = '#{params[:section]}'", :order => "sort")
  end
  
  def index
    @section = params[:section]
    @page = Page.find(:first, :conditions => "section = '#{params[:section]}'", :order => "sort")
  end
  
  def about 
    @page = Page.find(:first, :conditions => "section = 'about'", :order => "sort")
  end
  
  protected

  def collection
    @pages ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
