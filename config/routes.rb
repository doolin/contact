# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins

  resources :email_contacts
  get '/thankyou', to: 'email_contacts#thankyou'
  root to: 'email_contacts#new'

  devise_scope :admin do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
end
