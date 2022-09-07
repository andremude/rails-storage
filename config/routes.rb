Rails.application.routes.draw do
  devise_for :users
  # , path_names: {sign_in: 'login', sign_out: 'logout'}
  root to: 'pages#home'
  resources :storages do
    resources :reservations, only: %i[create new]
  end
  get '/how_it_works', to: 'pages#how_it_works'
  get '/user_page', to: 'pages#user_page'
end
