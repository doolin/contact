require 'spec_helper'



describe EmailContactsController do

render_views

  describe "GET thankyou" do
    it "should have Thanks in the response" do
      get :thankyou
      response.should have_selector("p", :content => "Thanks")
    end
  end




  def mock_email_contact(stubs={})
    (@mock_email_contact ||= mock_model(EmailContact).as_null_object).tap do |email_contact|
      email_contact.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all email_contacts as @email_contacts" do
      EmailContact.stub(:all) { [mock_email_contact] }
      get :index
      assigns(:email_contacts).should eq([mock_email_contact])
    end
  end



  describe "GET show" do
    it "assigns the requested email_contact as @email_contact" do
      EmailContact.stub(:find).with("37") { mock_email_contact }
      get :show, :id => "37"
      assigns(:email_contact).should be(mock_email_contact)
    end
  end



  describe "GET new" do
    it "assigns a new email_contact as @email_contact" do
      EmailContact.stub(:new) { mock_email_contact }
      get :new
      assigns(:email_contact).should be(mock_email_contact)
    end
  end

  describe "GET edit" do
    it "assigns the requested email_contact as @email_contact" do
      EmailContact.stub(:find).with("37") { mock_email_contact }
      get :edit, :id => "37"
      assigns(:email_contact).should be(mock_email_contact)
    end
  end

=begin
  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created email_contact as @email_contact" do
        EmailContact.stub(:new).with({'these' => 'params'}) { mock_email_contact(:save => true) }
        post :create, :email_contact => {'these' => 'params'}
        assigns(:email_contact).should be(mock_email_contact)
      end



      it "redirects to the created email_contact" do
        EmailContact.stub(:new) { mock_email_contact(:save => true) }
        post :create, :email_contact => {}
        response.should redirect_to(email_contact_url(mock_email_contact))
      end

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved email_contact as @email_contact" do
        EmailContact.stub(:new).with({'these' => 'params'}) { mock_email_contact(:save => false) }
        post :create, :email_contact => {'these' => 'params'}
        assigns(:email_contact).should be(mock_email_contact)
      end

      it "re-renders the 'new' template" do
        EmailContact.stub(:new) { mock_email_contact(:save => false) }
        post :create, :email_contact => {}
        response.should render_template("new")
      end
    end

  end


  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested email_contact" do
        EmailContact.should_receive(:find).with("37") { mock_email_contact }
        mock_email_contact.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :email_contact => {'these' => 'params'}
      end

      it "assigns the requested email_contact as @email_contact" do
        EmailContact.stub(:find) { mock_email_contact(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:email_contact).should be(mock_email_contact)
      end

      it "redirects to the email_contact" do
        EmailContact.stub(:find) { mock_email_contact(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(email_contact_url(mock_email_contact))
      end
    end

    describe "with invalid params" do
      it "assigns the email_contact as @email_contact" do
        EmailContact.stub(:find) { mock_email_contact(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:email_contact).should be(mock_email_contact)
      end

      it "re-renders the 'edit' template" do
        EmailContact.stub(:find) { mock_email_contact(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested email_contact" do
      EmailContact.should_receive(:find).with("37") { mock_email_contact }
      mock_email_contact.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the email_contacts list" do
      EmailContact.stub(:find) { mock_email_contact }
      delete :destroy, :id => "1"
      response.should redirect_to(email_contacts_url)
    end
  end
=end
end
