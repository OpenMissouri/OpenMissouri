class CreateSunshineRequests < ActiveRecord::Migration
  def self.up
    create_table :sunshine_requests do |t|
      t.column :user_id, :integer
      t.column :data_set_id, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :sunshine_requests
  end
end
