# frozen_string_literal: true

Contact::Application.routes.draw do
  devise_for :admins

  resources :email_contacts
  get '/thankyou', to: 'email_contacts#thankyou'
  root to: 'email_contacts#new'

  # This route is for eliminating the default devise sign up
  # devise_for :admins, controllers: { registrations: 'admin/registrations' }

  devise_scope :admins do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
end
