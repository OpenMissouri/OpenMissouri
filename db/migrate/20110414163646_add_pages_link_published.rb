class AddPagesLinkPublished < ActiveRecord::Migration
  def self.up
    add_column :pages, :published, :boolean, :default => true
  end

  def self.down
    remove_column :pages, :published
  end
end