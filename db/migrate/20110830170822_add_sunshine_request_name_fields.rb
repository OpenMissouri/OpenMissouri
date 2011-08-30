class AddSunshineRequestNameFields < ActiveRecord::Migration
  def self.up
    add_column :sunshine_requests, :first_name, :string
    add_column :sunshine_requests, :last_name, :string
    add_column :sunshine_requests, :entity_name, :string
    add_column :sunshine_requests, :agency_name, :string
  end

  def self.down
    remove_column :sunshine_requests, :first_name
  end
end