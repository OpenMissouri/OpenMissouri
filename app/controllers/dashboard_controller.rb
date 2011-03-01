class DashboardController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @categories = Category.find(:all, :order => "name")
    @data_sets = DataSet.find(:all, :conditions => {:status => "published"}, :order => "created_at desc", :limit => 10)
  end
  
  def about
    
  end
  
  def omteam
    
  end
  
  def opensource
    
  end
    
    
    
end
