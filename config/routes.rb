Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/test1', to: 'pages#test1'
  get '/test2', to: 'pages#test2'
  get '/test3', to: 'pages#test3'
end
