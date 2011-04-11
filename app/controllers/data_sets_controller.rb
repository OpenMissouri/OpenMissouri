class DataSetsController < ApplicationController
  before_filter :authenticate_user!, {:only => [:suggest, :create]}
  before_filter :authenticate_admin, {:only => [:new, :edit, :destroy]}
  inherit_resources
  
  def index
    @data_sets = DataSet.paginate :page => params[:page], :conditions => {:status => "published"}, :order => "created_at desc", :per_page => 20
    @categories = Category.published_categories
    if params[:query]
       @search = DataSet.search { keywords 'water' }
        @data_sets  = @search.results
    end
    
    #index!
    respond_to do |format|
      format.html
      format.rss { render :layout => false } #index.rss.builder
    end
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
  
  def feed
      @data_sets = DataSet.all(:order => "created_at DESC", :limit => 20) 

      respond_to do |format|
        format.html
        format.rss { render :layout => false } #index.rss.builder
      end
  end
  
  
  def create
    @data_set = DataSet.new(params[:data_set])
    UserMailer.dataset_thanks_email(@data_set.suggester, @data_set).deliver if @data_set.suggester
    create!{suggest_thanks_path(@data_set) if @data_set.suggester}
  end
  
  def thanks
    @data_set = DataSet.find(params[:id])
    @categories = Category.find(:all, :order => "name")
    #we should send an email out the suggester and the admin 
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
