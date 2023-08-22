Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :pets
  resources :pages

  resources :users
  get "profile", to: "users#profile"

end
