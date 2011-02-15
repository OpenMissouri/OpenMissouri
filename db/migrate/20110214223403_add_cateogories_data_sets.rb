class AddCateogoriesDataSets < ActiveRecord::Migration
  def self.up
    create_table :categories_data_sets, :force => true do |t|
      t.column :category_id, :integer
      t.column :data_set_id, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :categories_data_sets
  end
end