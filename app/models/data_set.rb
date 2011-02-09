class DataSet < ActiveRecord::Base
  belongs_to :organization
  belongs_to :user
  belongs_to :category
  
  #acts_as_taggable
  #acts_as_taggable_on :categories
end
