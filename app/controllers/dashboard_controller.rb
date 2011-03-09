class DashboardController < ApplicationController
  #before_filter :authenticate_user!

  def index
    #@categories = 
    @data_sets = DataSet.find(:all, :conditions => {:status => "published"}, :order => "created_at desc", :limit => 10)
    @categories = Category.published_categories
  end
  
  def about
    
  end
  
  def omteam
    
  end
  
  def opensource
    
  end
  
  def search
    @categories = Category.published_categories
  end
  
  def faq

  end
    
end
