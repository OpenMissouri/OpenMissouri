class Category < ActiveRecord::Base
  has_and_belongs_to_many :data_sets

  def self.published_categories  
    find(:all, :conditions => "id in (#{DataSet.find(:all, :conditions => {:status => "published"}).collect{|data_set| data_set.categories.collect{|category| category.id}}.flatten.join(",")})", :order => "name")
  end 
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
end
