class ChangeSuggestedBy < ActiveRecord::Migration
  def self.up
    rename_column :data_sets, :suggested_by, :suggester_id
  end

  def self.down
    rename_column :data_sets, :suggester_id, :suggested_by
    
  end
end