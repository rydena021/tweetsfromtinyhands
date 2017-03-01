Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/components', to: 'pages#components'
  get '/sentiment', to: 'pages#sentiment'
  get '/cloud', to: 'pages#cloud'
  get '/time', to: 'pages#time'
end
