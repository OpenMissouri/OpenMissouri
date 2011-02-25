class AddOrgStatus < ActiveRecord::Migration
  def self.up
    add_column :organizations, :status, :string, :default => "published"
  end

  def self.down
    remove_column :organizations, :status
  end
end