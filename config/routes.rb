Project2::Application.routes.draw do
  resources :users
  resources :posts do
    resources :comments, only:[:new,:create,:index,:show]
    get 'likes' => 'likes#index'
    post 'likes' => 'likes#create'
    # delete 'likes/:id' => 'likes#destroy', as: 'unlike'
  end
  delete 'likes/:id' => 'likes#destroy', as: 'unlike'
  resources :shots, only:[:new,:show,:create,:index,:destroy]

  # user authenitcation
  get 'login' => 'auths#new', as: 'login'
  get 'logout' => 'auths#destroy', as: 'logout'
  resources :auths, only:[:create]
  
  root 'posts#index'

end
