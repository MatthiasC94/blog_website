Rails.application.routes.draw do
  devise_for :usermodels
  resources :contacts, only: [:new, :create]
  resources :posts 
  resources :projects
  get 'welcome/index'
  root 'welcome#index'
end