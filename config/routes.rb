Rails.application.routes.draw do
  devise_for :users
  get '/admin', to: 'admin#index'
  get 'flower_smith', to: 'landings#flower_smith'
  get 'two_barn_farm', to: 'landings#two_barn_farm'
  get 'csa', to: 'landings#csa'
  get 'farmers', to: 'landings#farmers'
  get 'plants', to: 'landings#plants'
  get '/store', to: 'store#index'
  get '/filter', to: 'store#filter'
  get '/sort', to: 'store#sort'

  resources :categories
  resources :comments
  resources :posts
  resource :checkout
  resources :users
  resources :line_items
  resources :carts

  resources :products do
    get :who_bought, on: :member
    post 'toggle', on: :member
  end


  root 'landings#two_barn_farm', as: 'tbf'
end
