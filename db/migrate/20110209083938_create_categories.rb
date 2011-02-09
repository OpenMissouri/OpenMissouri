class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    Category.create(:name => "Agriculture and food production")
    Category.create(:name => "Business and commerce")
    Category.create(:name => "Communications")
    Category.create(:name => "Education")
    Category.create(:name => "Energy and utilities")
    Category.create(:name => "Environmental protection")
    Category.create(:name => "Government")
    Category.create(:name => "Health")
    Category.create(:name => "History and culture")
    Category.create(:name => "Housing and community development")
    Category.create(:name => "Human services and social programs")
    Category.create(:name => "Industry and technology")
    Category.create(:name => "Jobs, employment and occupations")
    Category.create(:name => "Laws and regulations")
    Category.create(:name => "Legal services and courts")
    Category.create(:name => "Natural resources")
    Category.create(:name => "Public safety and corrections")
    Category.create(:name => "Recreation and tourism")
    Category.create(:name => "Taxes and government revenue")
    Category.create(:name => "Transportation and motor vehicles")
    Category.create(:name => "Voting and elections")
    
  end

  def self.down
    drop_table :categories
  end
end
