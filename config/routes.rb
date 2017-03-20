Rails.application.routes.draw do

  root to: 'pages#home'
  get "about" => "pages#about"

  devise_for :users

  resources :users, only: [:show]
  resources :events
  resources :categories
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos
  resources :events do
    resources :registrations, only: [:create]


end
