class UsersController < ApplicationController
  def index
#    @user = current_user
 #   @books = Book.all

  #  render :action => "edit"
    @users = User.all.paginate(:page => params[:page], :per_page => 10)
  
  end
  
  def edit
    puts "******** #{params[:id]} +  + #{current_user.id}"
    if params[:id] != current_user.id.to_s
      flash[:error] = "You can't edit another user's profile"
      redirect_to '/'
    else
      @user = User.find(params[:id])
    end 
    
    
  end
  
  def show
    @user = User.find(params[:id])

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
  
  def sign_in
    
  end
end
