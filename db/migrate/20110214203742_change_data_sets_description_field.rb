class ChangeDataSetsDescriptionField < ActiveRecord::Migration
  def self.up
    change_column :data_sets, :description, :text
  end

  def self.down
    change_column :data_sets, :description, :string
  end
end