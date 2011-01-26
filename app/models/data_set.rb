class DataSet < ActiveRecord::Base
  belongs_to :organization
  belongs_to :user
  
  acts_as_taggable
  acts_as_taggable_on :categories
end
