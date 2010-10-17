class User < ActiveRecord::Base
  acts_as_authentic
  ajaxful_rater
  
  validates_presence_of :oauth_id, :username, :full_name, :provider
  validates_format_of :website, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
  
  def User.create_using_twitter_data(oauth_data)
    user_info = oauth_data["user_info"]
    oauth_id = oauth_data["uid"]
    user = User.create(:oauth_id => oauth_id, :full_name => user_info["name"], 
                       :username => user_info["nickname"], :twitter_username => user_info["nickname"],
                       :provider => "twitter")
  end
  
  def User.find_using_twitter_data(oauth_data)
    
    oauth_id = oauth_data["uid"]
    user = User.find(:first, :conditions => {:oauth_id => :oauth_id, :provider => "twitter"})
  end
end
