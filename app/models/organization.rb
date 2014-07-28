class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :data_sets, :order => "created_at desc"
  has_many :published_data_sets, :class_name => "DataSet", :conditions => {:status => "published"}, :order => "created_at desc"
  
  belongs_to :government_level
  
  cattr_reader :per_page
  @@per_page = 20
  
  #searchable do
  #  text    :description
  #  string  :name
  #  string  :sunshine_contact
  #  string  :sunshine_title
  #  string  :sunshine_phone
  #  string  :sunshine_email
  #  string  :city
  #  string  :state
  #  time    :created_at
  #end
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
end
