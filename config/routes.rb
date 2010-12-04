Contact::Application.routes.draw do

  resources :email_contacts
  resources :users
  
  #get "email_contacts/thankyou"
  
  match '/thankyou', :to => 'email_contacts#thankyou'

  root :to => 'email_contacts#new'

end
