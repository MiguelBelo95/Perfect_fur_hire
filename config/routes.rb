Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "dashboard", to: "dashboard#index"

  resources :pets do
    # Booking is displayed on /pets/:id/bookings/new
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :edit, :update]

  resources :pages
  resources :users
  get "profile", to: "users#profile"
end
