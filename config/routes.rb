Rails.application.routes.draw do
  resources :lists
  resources :feeds
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root to:'feeds#index'
  match '/users',   to: 'users#index',   via: 'get'
  mount Commontator::Engine => '/commontator'
  resources :users, :only => [:index, :show] do
    resources :follows, :only => [:create, :destroy]
  end
  resources :feeds do
    member do
      put "like", to: "feeds#upvote"
      put "dislike", to: "feeds#downvote"
    end
  end
end
