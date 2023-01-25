Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'

  # Posts Routes
  get '/post/new', to: 'posts#new'
  post '/post/new', to: 'posts#create'
  get '/users/:user_id/posts', to: 'posts#index'
  get '/users/:user_id/posts/:id', to: 'posts#show'
end
