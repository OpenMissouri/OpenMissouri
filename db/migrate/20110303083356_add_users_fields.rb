class AddUsersFields < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :position, :string
    add_column :users, :affiliation, :string
    add_column :users, :website, :string
    add_column :users, :twitter, :string
    add_column :users, :street1, :string
    add_column :users, :street2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :postal_code, :string
    add_column :users, :agency_id, :integer
  end

  def self.down
    remove_column :users, :agency_id
    remove_column :users, :postal_code
    remove_column :users, :state
    remove_column :users, :city
    remove_column :users, :street2
    remove_column :users, :street1
    remove_column :users, :twitter
    remove_column :users, :website
    remove_column :users, :affiliation
    remove_column :users, :position
    remove_column :users, :last_name
    remove_column :users, :first_name
  end
end