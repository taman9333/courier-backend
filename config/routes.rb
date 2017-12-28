Rails.application.routes.draw do
  # namespace :courier do
    # resources :couriers
    post 'login', to: 'courier_sessions#create'
    post 'register', to: 'courier_registrations#create'
    get 'all', to: 'couriers#index'
  # end
end
