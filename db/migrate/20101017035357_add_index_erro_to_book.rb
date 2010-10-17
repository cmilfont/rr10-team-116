class AddIndexErroToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :index_erro, :string
  end

  def self.down
    remove_column :books, :index_erro
  end
end

