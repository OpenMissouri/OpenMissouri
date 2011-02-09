class ChangeGoveLevelName < ActiveRecord::Migration
  def self.up
    rename_column :organizations, :governement_level_id, :government_level_id
  end

  def self.down
    rename_column :organizations, :new_column_name, :column_name
  end
end