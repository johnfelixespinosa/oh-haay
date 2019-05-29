Rails.application.routes.draw do
  resources :users

  namespace :api do
    namespace :v1 do
      get '/meetup', to: 'auth#meetup_request'
      get '/auth', to: 'auth#meetup_auth'
      get '/profile', to: 'users#profile'
      get '/groups', to: 'groups#fetch_user_groups_info'
      get '/groups/:group_id/users', to: 'groups#users'
      
      get '/statuses/:user_id/:group_id/fetch', to: 'statuses#fetch'
      post 'statuses/new', action: :add_new, controller: 'statuses'

      # post '/statuses/:group_id/new', to: 'statuses#add_new'
      # get '/events', to: 'events#fetch_groups_events'
    end
  end
end
