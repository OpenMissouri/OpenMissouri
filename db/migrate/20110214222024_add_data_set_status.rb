class AddDataSetStatus < ActiveRecord::Migration
  def self.up
    add_column :data_sets, :status, :string, :default => "unpublished"
  end

  def self.down
    remove_column :data_sets, :status
  end
end