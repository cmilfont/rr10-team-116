require 'spec_helper'


describe UsersController, "Updateing user data" do
  
  it "should only show the logged user" do
    user_session = mock_model(UserSession)
    user = mock_model(User)
    user_session.stub(:user).and_return(user)
    user.stub(:username).and_return("rr10_team_116")

    UserSession.stub(:find).and_return(user_session)

    get "index"
    assigns[:user].username.should == "rr10_team_116"
    
    response.should render_template("edit")
  end
  
  it "should allow user to update his user when the data is ok" do
    user = mock_model(User)
    user.stub(:update_attributes).and_return(true)
    User.stub(:find).and_return(user)
    
    post "update"
    
    assigns[:user].should == user
    flash[:notice] = "Data successfully updated"
    response.should redirect_to "/"
  end
  
  
  it "should not allow user to update his user when the data is not ok" do
    user = mock_model(User)
    user.stub(:update_attributes).and_return(false)
    User.stub(:find).and_return(user)
    
    post "update"
    
    assigns[:user].should == user
    response.should  render_template("edit")
  end
end
