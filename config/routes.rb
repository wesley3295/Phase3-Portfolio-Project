Rails.application.routes.draw do
  
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  resources :articles
  resources :comments
  resources :replies
  resources :subscriptions
  resources :articles, only: [:show] do
    resources :comments, only: [:show, :index, :new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "articles#index"
end
