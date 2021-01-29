Rails.application.routes.draw do
  
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations', :omniauth_callbacks => "omniauth_callbacks"}
  resources :articles
  root to: "articles#index"
  resources :articles, only: [:show] do
    resources :comments, only: [:show, :index, :new]
  end
  resources :comments
  resources :replies
  resources :subscriptions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
