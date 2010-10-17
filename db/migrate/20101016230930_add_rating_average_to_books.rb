class AddRatingAverageToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :rating_average, :decimal, :default => 0, :precision => 6, :scale => 2
  end

  def self.down
    remove_column :books, :rating_average
  end
end
