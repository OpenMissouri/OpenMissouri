class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.string :government_level
      t.string :governement_entity_name
      t.string :agency_head
      t.string :sunshine_contact
      t.string :sunshine_title
      t.string :sunshine_phone
      t.string :sunshine_email
      t.boolean :accepts_email_requests
      t.string :website
      t.text :description
      t.string :openness_rating
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :notes
      t.string :fax
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :organizations
  end
end
