class User < ActiveRecord::Base
  acts_as_authentic
  
  def User.create_using_twitter_data(oauth_data)
    user_info = oauth_data["user_info"]
    oauth_id = oauth_data["uid"]
    user = User.create(:oauth_id => oauth_id, :full_name => user_info["name"], 
                       :usarname => user_info["nickname"], :twitter_username => user_info["nickname"],
                       :provider => "twitter")
  end
  
  def User.find_using_twitter_data(oauth_data)
    
    oauth_id = oauth_data["uid"]
    user = User.find(:first, :conditions => {:oauth_id => :oauth_id, :provider => "twitter"})
  end
end
