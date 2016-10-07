Rails.application.routes.draw do

  root 'posts#index'

  get 'contact' => 'contacts#new'

  get 'contacts/create'

  get 'about' => 'about#index'

  namespace :admin do
    get 'login' => "sessions#new", as: "login"
  end

  namespace :admin do
    get 'logout' => "sessions#destroy", as: "logout"
  end

  namespace :admin do
    post 'sessions/create' => "sessions#create", as: "sessions/create" 
  end

  namespace :admin do
    resources :users
  end

  namespace :admin do
    get 'comments/destroy'
  end

  get 'comments/new'

  namespace :admin do
    resources :categories
  end

  resources :categories, only: [:show]

  namespace :admin do
    resources :posts
  end

  resources :posts , only: [:index, :show]

  resources :posts do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
