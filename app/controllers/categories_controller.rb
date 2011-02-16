class CategoriesController < ApplicationController
  inherit_resources
  
  def show
    @categories = Category.find(:all, :order => "name")
    show!
  end
  
  protected

  def collection
    @categories ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
