class Api::V1::AuthController < ApplicationController
  def meetup_request
    client_id = Rails.application.credentials.meetup[:client_id]
    client_id = Rails.application.credentials.meetup[:secret]
    redirect_uri = "http://localhost:3001/api/v1/auth"
    meetup_url = "https://secure.meetup.com/oauth2/authorize?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
    redirect_to meetup_url 
  end

  def meetup
    authenticator = Authenticator.new
    user_info = authenticator.meetup(params[:code])

    # login = user_info[:login]
    # name = user_info[:name]
    # avatar_url = user_info[:avatar_url]

    # Generate token...
    token = TokiToki.encode(login)
    # ... create user if it doesn't exist...
    User.where(login: login).first_or_create!(
      name: name,
      avatar_url: avatar_url
    )
    # ... and redirect to client app.
    redirect_to "#{issuer}?token=#{token}"
  rescue StandardError => error
    redirect_to "#{issuer}?error=#{error.message}"
  end

  private

  def issuer
    ENV['FLASHCARDS_CLIENT_URL']
  end
end