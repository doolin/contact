Contact::Application.routes.draw do

  resources :email_contacts

  #get "email_contacts/thankyou"

  match '/thankyou', :to => 'email_contacts#thankyou'
  #match "/admins/sign_up", :to => 'email_contacts#new'

  root :to => 'email_contacts#new'

  # This route is for eliminating the default devise sign up
  devise_for :admins, :controllers => {:registrations => 'admin/registrations'}

  devise_scope :admin do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

end
