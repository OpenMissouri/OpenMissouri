class CategoriesController < ApplicationController
  inherit_resources
  
  def show
    @categories = Category.published_categories    
    show!
  end
  
  protected

  def collection
    @categories ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
