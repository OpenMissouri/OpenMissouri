class PopulateGovernmentLevels < ActiveRecord::Migration
  def self.up
    GovernmentLevel.create(:name => "State")
    GovernmentLevel.create(:name => "County")
    GovernmentLevel.create(:name => "Municipal")
    GovernmentLevel.create(:name => "School District")
    GovernmentLevel.create(:name => "Other")
    
  end

  def self.down
  end
end
