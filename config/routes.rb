Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/testA', to: 'pages#testA'
  get '/testB', to: 'pages#testB'
  get '/testC', to: 'pages#testC'
  get '/testD', to: 'pages#testD'
  get '/components', to: 'pages#components'
end
