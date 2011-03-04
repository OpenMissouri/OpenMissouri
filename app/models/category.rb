class Category < ActiveRecord::Base
  has_and_belongs_to_many :data_sets

  def self.published_categories  
    find(:all, :conditions => "id in (#{DataSet.find(:all).collect{|data_set| data_set.categories.collect{|category| category.id}}.flatten.join(",")})", :order => "created_at desc")
  end 
end
