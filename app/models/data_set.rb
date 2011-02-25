class DataSet < ActiveRecord::Base
  
  belongs_to :organization
  belongs_to :user
  has_and_belongs_to_many :categories
  belongs_to :suggester, :class_name => "User", :foreign_key => "suggester_id"
  acts_as_commentable
  
  cattr_reader :per_page
  @@per_page = 20
  
  
  acts_as_taggable
  acts_as_taggable_on :tags
  
  def to_param
		"#{id}-#{name.gsub(/[^a-z0-9]+/i, '-').downcase}"
	end
end
