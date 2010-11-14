require 'spec_helper'


# This is messed up, it's not finding the template,
# going to deep into the stack otherwise.
#describe "email_contacts/thankyou.html.erb" do
describe "Get 'thankyou'" do

  it "should have 'Thanks'" do
    # Solves the stack too deep issue
    render
    #puts thankyou_path
    get :thankyou
    response.should have_selector("p", :content => "Thanks")
  end


end
