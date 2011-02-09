class DashboardController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @categories = Category.find(:all, :order => "name")
    @data_sets = DataSet.find(:all, :order => "created_at desc")
  end
  
  def about
    
  end
  
  def omteam
    
  end
  
  def opensource
    
  end
    
    
    
end
