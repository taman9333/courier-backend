Rails.application.routes.draw do
  resources :couriers
  resources :courier_registerations, only: [:create]
  post 'courierlogin', to: 'courier_sessions#create'
  # resources :courier_sessions, only: [:create]
end
