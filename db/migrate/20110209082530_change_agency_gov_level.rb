class ChangeAgencyGovLevel < ActiveRecord::Migration
  def self.up
    add_column :organizations, :governement_level_id, :integer
  end

  def self.down
    remove_column :organizations, :governement_level_id
  end
end