Rails.application.routes.draw do
  # match 'auth/:provider/callback', to: 'sessions#create'
  # match 'auth/failure', to: redirect('/')
  devise_for :users, controllers: {registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks", sessions: "users/sessions"}
  root "static_pages#home"
  get "home"      => "static_pages#home"
  get "help"      => "static_pages#help"
  get "contact"   => "static_pages#contact"
  get "about"     => "static_pages#about"
  # get "signup"    => "users#new"
  # get "login"     => "sessions#new"
  # post "login"    => "sessions#create"
  # delete "logout" => "sessions#destroy"

  resources :users, only: [:index, :show] do
    resources :followers, only: [:index]
    resources :followings, only: [:index]
  end

  # namespace :admin do
  #   root "users#index"
  #   resources :users, only: [:index, :destroy]
  #   resources :words
  #   resources :caterories
  # end

  resources :caterories
  resources :lessons, only: [:create, :show, :index]
  resources :words
  resources :relationships, only: [:create, :destroy]
  resources :checks, only: :create
end
