class DashboardController < ApplicationController
  require 'open-uri'
  #before_filter :authenticate_user!
  before_filter :prepare_global_sidebar, {:only => [:index]}
  
  def index
    #@categories = 
    @data_sets = DataSet.find(:all, :conditions => {:status => "published"}, :order => "created_at desc", :limit => 10)
    
    # reference: http://snippets.aktagon.com/snippets/158-Parsing-feeds-with-Ruby-and-the-FeedTools-gem
    #FeedTools.configurations[:idn_enabled] = false
    #@ic = Iconv.new('ISO-8859-1', 'UTF-8')
    #feed.description = @ic.iconv(feed.description)
    
    #@feed = FeedTools::Feed.open('http://blog.openmissouri.org/?feed=rss2')
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
    
    
  def terms

  end
  
  def privacy

  end
end
