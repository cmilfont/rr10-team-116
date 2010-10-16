class RenameUsersUsarnameToUsername < ActiveRecord::Migration
  def self.up
    rename_column :users, :usarname, :username
  end

  def self.down
    rename_column :users, :username, :usarname

  end
end
