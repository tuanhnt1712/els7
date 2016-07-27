Rails.application.routes.draw do
  root "static_pages#home"
  get "home"      => "static_pages#home"
  get "help"      => "static_pages#help"
  get "contact"   => "static_pages#contact"
  get "about"     => "static_pages#about"
  get "signup"    => "users#new"
  get "login"     => "sessions#new"
  post "login"    => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :users
  namespace :admin do
    resources :words
    resources :caterories
  end
  resources :caterories, only: [:index, :show]
  resources :words,      only: [:index, :show]
end
