Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :factions do # resources :faction, path: 'teams' to change url
    resources :strategies, except: [:show, :edit, :new]
  end

  resources :great_old_ones

  resource :user
  get 'sign_up', action: :new, controller: 'users'
  get 'profile', action: :show, controller: 'users'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'profile/factions/edit', to: 'user_factions#edit'
  get 'profile/factions/:faction_id', to: 'user_factions#show'
  patch '/profile/factions', to: 'user_factions#update'

  namespace :admin do
    get '/dashboard', to: "dashboard#index"
    resources :game_days, only: [:create, :destroy, :update]
  end

  patch '/can_attends', to: 'can_attends#update'

  get '/join_team', to: 'teams#edit', as: '/join_team'
  get '/teams/:id', to: 'teams#show'
  patch '/teams/:id', to: 'teams#update'

end

# resource (singular)
# use strategies over user_strategies since we are never showing more than 1 users strategies
# un-nest strategies since only ever using 1 user at a time
# faction strategy takes over for user strategies
#
