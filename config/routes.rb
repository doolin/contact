Contact::Application.routes.draw do

  resources :email_contacts
  
  #get "email_contacts/thankyou"
  
  match '/thankyou', :to => 'email_contacts#thankyou'

  root :to => 'email_contacts#new'

  devise_for :admins

  devise_scope :admin do
    get "/login" => "devise/sessions#new"
  end

end
