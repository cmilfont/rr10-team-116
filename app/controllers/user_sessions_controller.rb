class UserSessionsController < ApplicationController
  def new
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
      #redirect_to(session[:return_to])
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

  ERRORS = {"invalid_credentials" => "Invalid Crendentials"}

  def auth_failure
    flash[:error] = ERRORS[params[:message]]
    redirect_to "/"
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful, goodbye!"
    redirect_back_or_default("/")
  end
end

