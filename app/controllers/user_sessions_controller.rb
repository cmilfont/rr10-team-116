class UserSessionsController < ApplicationController
  def new
    redirect_to "/auth/twitter"
  end

  def create
    auth_data = request.env['rack.auth']
    provider = auth_data["provider"]
    
    
    user = User.send("find_using_#{provider}_data", auth_data)
    if user
      @user_session = UserSession.new(user)
      if @user_session.save
        flash[:notice] = "Welcome, #{user.full_name}!"
      else
        flash[:error] = "Sorry, we couldn't proceed with your login. We'll fix it ASAP"
      end
      redirect_to "/"
    else
      user = User.send("create_using_#{provider}_data", auth_data)
      @user_session = UserSession.new(user)
      if @user_session.save
        redirect_to :controller => :users, :action => "index"
      else
        flash[:error] = "Sorry, we couldn't proceed with your login. We'll fix it ASAP"
        redirect_to "/"
      end
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful, goodbye!"
    redirect_to "/"
  end
end
