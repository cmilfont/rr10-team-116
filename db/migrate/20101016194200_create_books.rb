class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.belongs_to :author
      t.string :year
      t.string :edition
      t.string :publisher

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
