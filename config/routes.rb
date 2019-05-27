Rails.application.routes.draw do
  resources :users

  namespace :api do
    namespace :v1 do
      get '/meetup', to: 'auth#meetup_request'
      get '/auth', to: 'auth#meetup_auth'
      get '/profile', to: 'users#profile'
      get '/groups', to: 'groups#fetch_user_groups_info'
      get '/groups/:group_id/users', to: 'groups#users'

      get '/statuses/:group_id/new', to: 'statuses#add_new'
      # get '/events', to: 'events#fetch_groups_events'
    end
  end
end
