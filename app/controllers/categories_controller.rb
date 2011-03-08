class CategoriesController < ApplicationController
  inherit_resources
  
  def show
    @categories = Category.published_categories    
    @category = Category.find(params[:id])
    @data_sets = @category.data_sets.paginate :page => params[:page], :conditions => {:status => "published"}, :order => 'data_sets.created_at desc', :per_page => 20
    
    show!
  end
  
  protected

  def collection
    @categories ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
