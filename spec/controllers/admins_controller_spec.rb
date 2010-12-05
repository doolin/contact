require 'spec_helper.rb'

describe AdminsController do 

  render_views

  describe "#sign_in" do 

    it "should be successful" do
      get :login
      response.should be_success
    end   

  end

end 
