class AddAttachmentsFileToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :file_file_name, :string
    add_column :books, :file_content_type, :string
    add_column :books, :file_file_size, :integer
  end

  def self.down
    remove_column :books, :file_file_name
    remove_column :books, :file_content_type
    remove_column :books, :file_file_size
  end
end

