class DataSetsController < ApplicationController
  inherit_resources
  
  def index
    @categories = Category.find(:all, :order => "name")
    index!
  end
  
  def category
    #@data_sets = DataSet.tagged_with(params[:id])
    @categories = Category.find(:all, :order => "name")
    index!
  end
  
  
  protected

  def collection
    @data_sets ||= end_of_association_chain.paginate(:page => params[:page], :order => "created_at desc", :limit => 10)
  end
end
