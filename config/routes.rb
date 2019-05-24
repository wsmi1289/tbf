Rails.application.routes.draw do
  resources :side_bar_contents
  devise_for :users
  get 'flower_smith', to: 'landings#flower_smith'
  get 'two_barn_farm', to: 'landings#two_barn_farm'
  get '/store', to: 'store#index'
  
  resources :users, only: [:update]
  resources :admin, only: [:index, :create] do
    get 'users', to: 'admin#users'
  end
  resources :categories
  resources :comments
  resources :posts
  resource :checkouts
  resources :users
  resources :line_items
  resources :carts
  resources :pages, path: :tbf
  resources :products


  root 'landings#two_barn_farm', as: 'tbf'
end
