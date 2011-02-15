class DataSet < ActiveRecord::Base
  
  belongs_to :organization
  belongs_to :user
  has_and_belongs_to_many :categories
  belongs_to :suggester, :class_name => "User", :foreign_key => "suggester_id"
  acts_as_commentable
  
  #acts_as_taggable
  #acts_as_taggable_on :categories
end
