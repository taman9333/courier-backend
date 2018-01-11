Rails.application.routes.draw do

  namespace :courier, defaults:{format: :json} do
    post 'login', to: 'sessions#create'
    post 'register', to: 'registrations#create'
    patch 'update_profile', to: 'profile#update'
    get 'profile', to: 'profile#show'
    #  which http verb? 'forgot_password', to: 'profile#forgot_password'
    patch 'reset_password', to: 'profile#reset_password'
    get 'deliveries/index', to: 'deliveries#index'
    get 'deliveries/:id', to: 'deliveries#show'
    post 'deliveries/:id/update', to: 'deliveries#update_status'
    post 'search', to:'search#filter'
    get 'auctions', to:'search#index'
  end

  get 'open_auctoins', to: 'auctions#open_auctions'

  namespace :admin do
    get 'couriers', to: 'couriers#index'
    delete 'couriers', to: 'couriers#destroy'
  end

  get 'client/login', to: 'client_sessions#new'
  post 'client/sessions', to: 'client_sessions#create'


  # post '/orders', to: 'orders#create'

  resources :clients_registrations, only: [:new, :create]
  # get 'client/show', to: 'clients#show'


  resource :clients, only:[:show ], defaults:{format: :json} do
    collection do
      resources :orders
    end

    collection do
        resources :deliveries
    end
  end

  patch '/client/notification/check', to:'notifications#check'

  post '/bid/create', to:'bids#create'
  post '/bid/reject', to:'bids#reject'

  get 'client/addresses',to:'addresses#index'

  get 'client/notifications', to:'notifications#index', defaults:{format: :json}

end
