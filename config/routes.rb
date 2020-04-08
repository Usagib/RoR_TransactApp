Rails.application.routes.draw do
  get '/new_group', to: 'groups#new'
  post '/new_group', to: 'groups#create'
  get '/groups', to: 'groups#index'

  get '/new_transaction', to: 'transactions#new'
  post '/new_transaction', to: 'transactions#create'
  get '/transactions', to: 'transactions#index'

  root 'static_pages#home'

  post '/users/new', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :transactions
  resources :groups

end
