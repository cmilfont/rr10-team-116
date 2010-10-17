class RemoveAuthorIdAndAddAuthorFromBooks < ActiveRecord::Migration
  def self.up
    remove_column :books, :author_id
    add_column :books, :author, :string
  end

  def self.down
    add_column :books, :author_id, :integer
    remove_column :books, :author
  end
end
