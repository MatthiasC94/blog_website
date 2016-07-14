Rails.application.routes.draw do
  resources :posts
  resources :projects
  resources :contact
  get 'welcome/index'
  root 'welcome#index'
end
