Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:new, :index, :show, :create] do
      resources :comments, only: [:new, :create] 
      resources :likes, only: [:new]
    end
  end

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'

  # Posts Routes
  # get '/post/new', to: 'posts#new'
  # post '/post/new', to: 'posts#create'
  # get '/users/:user_id/posts', to: 'posts#index'
  # get '/users/:user_id/posts/:id', to: 'posts#show'

  # Comments Routes
  # get '/post/:post_id/comment/new', to: 'comments#new'
  # post '/post/:post_id/comment/new', to: 'comments#create', as: 'new_comment'

  # Like Routes
  # get '/post/:post_id/like/new', to: 'likes#create'

end
