Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get '/users'                   => 'users#index'
    get '/users/:id'               => 'users#show'
    get '/users/:user_id/posts', to: 'posts#index'
    get '/users/:user_id/posts/new' => 'posts#new'
    get '/users/:user_id/posts/:post_id' => 'posts#show'
    post '/users/:id/posts/create', to: 'posts#create'
    get '/users/:id/posts/:post_id/comments/new', to: 'comments#new'
    post '/users/:id/posts/:post_id/comments/create', to: 'comments#create'
    post '/users/:id/posts/:id/likes/create', to: 'likes#create'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :posts do
      resources :comments
      post 'likes', to: 'likes#create' # Nested route for creating a like
    end
  end
end
