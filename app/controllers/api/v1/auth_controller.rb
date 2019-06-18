class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized
  require 'pry'
  
  def meetup_request
    client_id = Rails.application.credentials.meetup[:client_id]
    redirect_uri = "http://localhost:3001/api/v1/auth"
    meetup_url = "https://secure.meetup.com/oauth2/authorize?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
    redirect_to meetup_url 
  end

  def meetup_auth
    authenticator = Authenticator.new
    user_info = authenticator.meetup(params[:code])

    name = user_info[:name]
    meetup_id = user_info[:meetup_id]
    meetup_profile_url = user_info[:meetup_profile_url]
    photo_url = user_info[:photo_url]
    city = user_info[:city]
    access_token = user_info[:access_token]
    # binding.pry
    # Generate token...
    token = encode_token(meetup_id: meetup_id)
    # ... create user if it doesn't exist...
    User.where(meetup_id: meetup_id).first_or_create!(
      name: name,
      meetup_id: meetup_id,
      meetup_profile_url: meetup_profile_url,
      photo_url: photo_url,
      city: city,
      access_token: access_token
    )
    # ... and redirect to client app.
    redirect_to "http://localhost:3000?token=#{token}"
  # rescue StandardError => error
  #   redirect_to "#{issuer}?error=#{error.message}"
  end

end
