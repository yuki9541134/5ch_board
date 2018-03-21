Rails.application.routes.draw do

  get  '/' => 'home#top'
  get  '/signup' => 'users#new'
  post 'users/create' => 'users#create'
  get  '/login' => 'users#login_form'
  post '/login' => 'users#login'
  get  '/logout' => 'users#logout'
  get  'users/:id' => 'users#show'  

  get  'titles/index'
  get  'titles/:id/show' => 'titles#show'
  get  'titles/:id/show/:range' => 'titles#show'
  post 'titles/new' => 'titles#create' 

  post 'posts/create' => 'posts#create'
  post 'posts/new/:id' => 'posts#check'
  get  'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'

end
