Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    get '/users'                   => 'users#index'
    get '/users/:id'               => 'users#show'
    get '/users/:user_id/posts'     => 'posts#index'
    get '/users/:user_id/posts/:post_id' => 'posts#show'
end
  # Defines the root path route ("/")
  # root "articles#index"
end
