class DropGovernmentLevel < ActiveRecord::Migration
  def self.up
    remove_column :organizations, :government_level 
  end

  def self.down
  end
end
