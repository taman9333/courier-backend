Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
