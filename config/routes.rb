Rails.application.routes.draw do
  resources :users

  namespace :api do
    namespace :v1 do
      ##From client Login button
      get '/meetup', to: 'auth#meetup_request'
      ##After meetup_request, redirect to with access code from meetup, exchange access code for token
      get '/auth', to: 'auth#meetup'
    end
  end
end
