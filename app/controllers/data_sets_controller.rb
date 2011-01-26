class DataSetsController < ApplicationController
  inherit_resources
  
  def index
    @categories = DataSet.category_counts
    index!
  end
  
  def category
    @data_sets = DataSet.tagged_with(params[:id])
    @categories = DataSet.category_counts
    index!
  end
  
  
  protected

  def collection
    @data_sets ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
