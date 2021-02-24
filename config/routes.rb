Rails.application.routes.draw do
  
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations', :omniauth_callbacks => "omniauth_callbacks"}
  resources :users, only: [:show]
  root to: "articles#index"
  resources :articles, only: [:index,:create] do
    resources :comments, only: [:index,:edit,:update,:new,:create,:destroy] do
      resources :replies, only: [:edit,:create,:update,:destroy,:delete]
    end
  end
  resources :subscriptions
  get '/max', to: 'articles#show'
  match '*path' => 'application#fallback', via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
