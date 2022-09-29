Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}
  root to: 'pages#home'

  resources :storages do
    resources :reservations, only: %i[create new]
  end

  # resources :users do
  #   resources :storages
  # end

  resources :reservations, only: %i[index show edit destroy update]

  get '/how_it_works', to: 'pages#how_it_works'
  get '/user_page', to: 'pages#user_page'
  # get 'users/:id/storages', to: 'users#storages', :as => :user_storages
  get 'users/:id/storages', to: 'storages#user_storages', :as => :user_storages
end
