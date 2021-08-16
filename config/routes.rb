Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :factions

  resources :great_old_ones

  resources :users
  get 'sign_up', action: :new, controller: 'users'
  get 'profile', action: :show, controller: 'users'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users/:id/factions/edit', to: 'user_factions#edit'
  patch '/user_factions', to: 'user_factions#update'

  namespace :admin do
    get '/dashboard', to: "dashboard#index"
  end

  resources :game_days, only: [:create, :destroy]
end
