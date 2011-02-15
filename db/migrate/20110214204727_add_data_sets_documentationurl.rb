class AddDataSetsDocumentationurl < ActiveRecord::Migration
  def self.up
    add_column :data_sets, :documentation_url, :string
    add_column :data_sets, :interest, :text
    add_column :data_sets, :suggested_by, :integer
    add_column :data_sets, :agency_other, :text
  end

  def self.down
    remove_column :data_sets, :agency_other
    remove_column :data_sets, :submitted_by
    remove_column :data_sets, :interest
    remove_column :data_sets, :documentation_url
  end
end