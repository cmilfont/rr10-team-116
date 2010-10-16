class UsersController < ApplicationController
  def index
    @user = current_user
    
    render :action => "edit"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
       flash[:notice] = "Data successfully updated"
       redirect_to :root
    else
      render "edit"
    end
  end
end