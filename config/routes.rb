Rails.application.routes.draw do
  
  devise_for :users
  resources :articles
  resources :comments
  resources :replies
  
  resources :articles, only: [:show] do
    resources :comments, only: [:show, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
