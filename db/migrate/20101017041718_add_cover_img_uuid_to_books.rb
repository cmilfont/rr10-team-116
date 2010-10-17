class AddCoverImgUuidToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :cover_img_uuid, :string
  end

  def self.down
    remove_column :books, :cover_img_uuid
  end
end
