Rails.application.routes.draw do
  resources :side_bar_contents
  devise_for :users
  get 'flower_smith', to: 'landings#flower_smith'
  get 'two_barn_farm', to: 'landings#two_barn_farm'
  get '/store', to: 'store#index'
  
  resources :users, only: [:index, :show, :update]
  resources :admin, only: [:index, :update]
  resources :categories, only: [:index, :create, :destroy]
  resources :comments, only: [:index, :new, :create, :destroy]
  resources :posts
  resource :checkouts, only: [:new, :create]
  resources :line_items, only: [:create, :update, :destroy]
  resources :carts, except: [:index]
  resources :pages, path: :tbf
  resources :products
  resources :crops
  resources :families
  resources :fields, except: [:new, :show]
  resources :plantings, only: [:index, :create, :update]
  resources :years, only: [:show]



  root 'landings#two_barn_farm', as: 'tbf'
end
