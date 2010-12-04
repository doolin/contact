Contact::Application.routes.draw do

  resources :email_contacts
  
  #get "email_contacts/thankyou"
  
  match '/thankyou', :to => 'email_contacts#thankyou'

  root :to => 'email_contacts#new'

end
