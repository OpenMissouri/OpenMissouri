class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :data_sets
  belongs_to :government_level
end
