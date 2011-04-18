class AddPagesLinkName < ActiveRecord::Migration
  def self.up
    add_column :pages, :link_name, :string
    remove_column :pages, :body_html
  end

  def self.down
  end
end