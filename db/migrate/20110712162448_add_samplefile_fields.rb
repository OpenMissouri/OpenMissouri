class AddSamplefileFields < ActiveRecord::Migration
  def self.up
    add_column :data_sets, :samplefile_file_name,    :string
    add_column :data_sets, :samplefile_content_type, :string
    add_column :data_sets, :samplefile_file_size,    :integer
    add_column :data_sets, :samplefile_updated_at,   :datetime
  end

  def self.down
  end
end
