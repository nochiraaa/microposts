Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'static_pages#home'
  get 'signup', to:'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'users/:id/followings', to:'users#followings', as: 'followings'
  get 'users/:id/followers', to:'users#followers', as: 'followers'
  
  resources :users
  resources :microposts
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy, :followings, :followers]
end
