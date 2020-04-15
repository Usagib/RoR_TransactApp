Rails.application.routes.draw do

  root 'mytransactions#index'
  get '/external', to: 'mytransactions#external'

  post '/groups/new', to: 'groups#create'
  post '/mytransactions/new', to: 'mytransactions#create'
  post '/users/new', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, only: %i[new]
  resources :mytransactions, only: %i[index new external]
  resources :groups, only: %i[index new show]

end
