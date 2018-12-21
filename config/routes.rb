Rails.application.routes.draw do
  resources :side_bar_contents
  # resources :side_bars
  devise_for :users
  get 'flower_smith', to: 'landings#flower_smith'
  get 'two_barn_farm', to: 'landings#two_barn_farm'
  get '/store', to: 'store#index'
  get '/filter', to: 'store#filter'
  get '/sort', to: 'store#sort'
  
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
  resources :products do
    get :who_bought, on: :member
    post 'toggle', on: :member
  end


  root 'landings#two_barn_farm', as: 'tbf'
end
