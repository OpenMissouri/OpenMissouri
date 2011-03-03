class DashboardController < ApplicationController
  #before_filter :authenticate_user!

  def index
    #@categories = 
    @data_sets = DataSet.find(:all, :conditions => {:status => "published"}, :order => "created_at desc", :limit => 10)
    @categories = Category.find(:all, :conditions => "id in (#{@data_sets.collect{|data_set| data_set.categories.collect{|category| category.id}}.flatten.join(",")})", :order => "name")
  end
  
  def about
    
  end
  
  def omteam
    
  end
  
  def opensource
    
  end
    
    
    
end
