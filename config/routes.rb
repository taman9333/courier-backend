Rails.application.routes.draw do
  namespace :courier do
    post 'login', to: 'sessions#create'
    post 'register', to: 'registrations#create'
    patch 'update_profile', to: 'profile#update'
    get 'profile', to: 'profile#show'
    #  which http verb? 'forgot_password', to: 'profile#forgot_password'
    patch 'reset_password', to: 'profile#reset_password'
  end

  namespace :admin do
    get 'couriers', to: 'couriers#index'
    delete 'couriers', to: 'couriers#destroy'
  end

end
