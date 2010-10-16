class UserSessionsController < ApplicationController
  def new
    redirect_to "/auth/twitter"
  end

  def create
    auth_data = request.env['rack.auth']
    oauth_id = auth_data["uid"]
    user = User.find(:first, :conditions => {:oauth_id => oauth_id})
    if !user
      user_info = auth_data["user_info"]
      user = User.create(:oauth_id => oauth_id, :full_name => user_info["name"], :usarname => user_info["nickname"], :twitter_username => user_info["nickname"])
    end
    
    @user_session = UserSession.new(user)
    if @user_session.save
      flash[:notice] = "Welcome, #{user.full_name}!"
    else
      flash[:error] = "Sorry, we couldn't proceed with your login. We'll fix it ASAP"
    end
    
    redirect_to "/"
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful, goodbye!"
    redirect_to "/"
  end
end
