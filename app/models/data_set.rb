class DataSet < ActiveRecord::Base
  
  belongs_to :organization
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :sunshine_requests
  belongs_to :suggester, :class_name => "User", :foreign_key => "suggester_id"
  acts_as_commentable

  attr_accessible :samplefile, :samplefile_file_name, :samplefile_content_type, :name, :organization_id, :category_ids, :description, :data_format, :cost, :period_start_date, :period_end_date, :update_frequency, :documentation_url, :tag_list, :notes, :status
  validates :name, :presence => true
  
  cattr_reader :per_page
  @@per_page = 20
  
  has_attached_file :samplefile
  
  
  before_post_process :is_image?

  def is_image?
    ["image/jpeg", "image/pjpeg", "image/png", "image/x-png", "image/gif"].include?(self.samplefile_content_type) 
  end
  
  acts_as_taggable
  acts_as_taggable_on :tags
  
  
  #searchable do
  #  text    :description
  #  string  :name
  #  string  :data_format
  #  time    :created_at
  #end
  
  def to_param
    # parameterize prettifies the url and downcases
    "#{id}-#{name.parameterize}"
  end

end
