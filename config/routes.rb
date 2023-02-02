Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:new, :index, :show, :create] do
      resources :comments, only: [:new, :create] 
      resources :likes, only: [:new]
    end
  end
end
