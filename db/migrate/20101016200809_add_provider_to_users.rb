class AddProviderToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :provider, :string
    User.find(:all, :conditions => {:provider => nil}).each do |user|
      user.provider = "twitter"
      user.save
    end
  end

  def self.down
    remove_column :users, :provider
  end
end
