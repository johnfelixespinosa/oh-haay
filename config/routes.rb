Rails.application.routes.draw do
  resources :users

  namespace :api do
    namespace :v1 do
      get '/meetup', to: 'auth#meetup_request'
      get '/auth', to: 'auth#meetup'
      get '/profile', to: 'users#profile'
      get '/groups', to: 'groups#fetch_user_groups_info'
      get '/events', to: 'events#fetch_groups_events'
    end
  end
end
