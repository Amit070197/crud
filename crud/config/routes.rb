Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  devise_for :users
  resources :books
  # root 'books#index'
  root 'home#main'
  get 'home/main'
  get 'counsel', to:'counsel#index'
end
