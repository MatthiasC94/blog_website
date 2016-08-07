Rails.application.routes.draw do
  devise_for :usermodels
  resources :contact
  resources :posts 
  resources :projects
  get 'welcome/index'
  root 'welcome#index'
end