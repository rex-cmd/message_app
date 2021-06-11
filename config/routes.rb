Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'chatroom#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout'=> 'sessions#destroy'
  post 'message'=> 'messages#create'# go and find messages controller and action create in it
  mount ActionCable.server, at: '/cable'
end
