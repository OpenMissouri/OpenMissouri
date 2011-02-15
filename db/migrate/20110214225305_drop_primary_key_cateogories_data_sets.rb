class DropPrimaryKeyCateogoriesDataSets < ActiveRecord::Migration
  def self.up
    remove_column :categories_data_sets, :id 
  end

  def self.down
  end
end
