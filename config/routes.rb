# frozen_string_literal: true

Contact::Application.routes.draw do
  # This route is for eliminating the default devise sign up
  devise_for :admins
  # devise_for :admins, controllers: { registrations: 'admin/registrations' }

  resources :email_contacts
  get '/thankyou', to: 'email_contacts#thankyou'
  root to: 'email_contacts#new'

  devise_scope :admin do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
end
