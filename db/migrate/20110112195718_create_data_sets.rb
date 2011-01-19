class CreateDataSets < ActiveRecord::Migration
  def self.up
    create_table :data_sets do |t|
      t.integer :organization_id
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :data_format
      t.string :cost
      t.datetime :period_start_date
      t.datetime :period_end_date
      t.string :update_frequency
      t.text :notes
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :data_sets
  end
end
