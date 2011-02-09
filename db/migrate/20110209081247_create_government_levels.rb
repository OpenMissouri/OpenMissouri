class CreateGovernmentLevels < ActiveRecord::Migration
  def self.up
    create_table :government_levels do |t|
      t.column :name, :string
      
      t.timestamps
    end
  end

  def self.down
    drop_table :government_levels
  end
end
