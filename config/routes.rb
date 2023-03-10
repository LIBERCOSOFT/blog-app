Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:new, :index, :show, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy] 
      resources :likes, only: [:new]
    end
  end
end
