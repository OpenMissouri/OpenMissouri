class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :data_sets, :order => "created_at desc"
  has_many :published_data_sets, :class_name => "DataSet", :conditions => {:status => "published"}, :order => "created_at desc", :limit => 20
  
  belongs_to :government_level
  
  cattr_reader :per_page
  @@per_page = 20
  
  def to_param
		"#{id}-#{name.gsub(/[^a-z0-9]+/i, '-').downcase}"
	end
  
end
