class AddDataSetCategoryId < ActiveRecord::Migration
  def self.up
    add_column :data_sets, :category_id, :integer
  end

  def self.down
    remove_column :data_sets, :category_id
  end
end