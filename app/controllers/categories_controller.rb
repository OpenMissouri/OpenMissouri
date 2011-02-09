class CategoriesController < ApplicationController
  inherit_resources
  
  protected

  def collection
    @categories ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
