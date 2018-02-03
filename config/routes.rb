Rails.application.routes.draw do
  post 'posts/new/:id' => 'posts#create'   

  get 'titles/index'
  get 'titles/:id/show' => 'titles#show'
  get 'titles/:id/show/:range' => 'titles#show'
  post 'titles/new' => 'titles#create' 

  get '/' => 'home#top'
end
