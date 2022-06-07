Rails.application.routes.draw do
  resources :memberships
  mount RailsAdmin::Engine => '/command_center/super_admin', as: 'rails_admin'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users

  resources :companies

  get '/member', to: "users#member"
  get '/admin', to: "users#admin"
  post '/admin', to: "users#admin"

  root to: "users#index"
end
