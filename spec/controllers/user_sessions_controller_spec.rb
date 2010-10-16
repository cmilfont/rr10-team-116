require 'spec_helper'


describe UserSessionsController, "Authenticating in the application using Twitter" do 
  it "should redirect to twitter page if you try to login" do
    get "new"
    response.should redirect_to '/auth/twitter'
  end
end