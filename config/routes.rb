Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/testA', to: 'pages#testA'
  get '/testB', to: 'pages#testB'
  get '/testC', to: 'pages#testC'
  get '/testD', to: 'pages#testD'
  get '/testE', to: 'pages#testE'
  get '/testF', to: 'pages#testF'
  get '/testG', to: 'pages#testG'
  get '/testH', to: 'pages#testH'
  get '/testI', to: 'pages#testI'
  get '/testJ', to: 'pages#testJ'
  get '/components', to: 'pages#components'
end
