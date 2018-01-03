Rails.application.routes.draw do

  namespace :courier do
    post 'login', to: 'sessions#create'
    post 'register', to: 'registrations#create'
    patch 'update_profile', to: 'profile#update'
    get 'profile', to: 'profile#show'
    #  which http verb? 'forgot_password', to: 'profile#forgot_password'
    patch 'reset_password', to: 'profile#reset_password'
  end
  
  # maybe we should edit this to get the info from the orders controller instead
  get 'filtered_open_auctoins', to: 'auctions#filter_open_auctions'
  get 'auctoin', to: 'auctions#show_order'
  
  namespace :admin do
    get 'couriers', to: 'couriers#index'
    delete 'couriers', to: 'couriers#destroy'
  end

  get 'client/login', to: 'client_sessions#new'
  post 'client/sessions', to: 'client_sessions#create'


  # post '/orders', to: 'orders#create'

  resources :clients_registrations, only: [:new, :create]
  # get 'client/show', to: 'clients#show'


  resource :clients, only:[:show ] do
    collection do
      resources :orders
    end
  end

  get 'client/addresses',to:'addresses#index'

end


