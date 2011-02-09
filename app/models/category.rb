class Category < ActiveRecord::Base
  has_many :data_sets
end
