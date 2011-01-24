class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
     @data_sets = DataSet.find(:all)
  end
  
  def about
    
  end
end
