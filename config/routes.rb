Rails.application.routes.draw do
  resources :posts
  resources :users
  post '/signup'   => 'users#create'
  post '/signin'   => 'users#signin'
  post '/post'     => 'posts#create'
  get  '/user'     => 'users#index'
  post '/follow'   => 'users#toggle'
  post '/unfollow' => 'users#toggle'
  get  '/timeline' => 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
