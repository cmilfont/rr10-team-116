class AddUserToBook < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.belongs_to :user
    end
  end

  def self.down
    remove_column :books, :user_id
  end
end

