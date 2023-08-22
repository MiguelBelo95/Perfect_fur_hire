Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :pets do
    # Booking is displayed on /pets/:id/bookings/new
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :update]
  
  resources :pages
  resources :users
  get "profile", to: "users#profile"

end
