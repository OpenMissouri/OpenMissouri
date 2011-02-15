class DataSetsController < ApplicationController
  before_filter :authenticate_user!, {:only => [:suggest]}
  before_filter :authenticate_admin, {:only => [:new, :edit, :destroy, :create, :destroy]}
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
  
  def show
    @data_set = DataSet.find(params[:id])
    @comment = @data_set.comments.new
    show!
  end
  
  def suggest
    @data_set = DataSet.new
    @data_set.suggester = current_user
    new!
  end
  
  protected

  def collection
    @data_sets ||= end_of_association_chain.paginate(:page => params[:page], :order => "created_at desc", :limit => 10)
  end
end
