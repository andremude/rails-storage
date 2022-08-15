Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :storages do
    resources :reservations, only: %i[create new]
  end
end
