Rails.application.routes.draw do
  get 'users/:id/profile', to: 'users#profile', as: :profile
  get 'users/:id/posts', to: 'users#user_posts', as: :user_posts
  get 'users/:id/fellowships/following', to: 'fellowships#following', as: :following
  get 'users/:id/fellowships/followers', to: 'fellowships#followers', as: :followers

  resources :users, only: [] do
    resources :fellowships, only: [:index, :create, :show]
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"

  resources :posts do
    resources :comments
    resources :likes, only: [:create]
  end
end
