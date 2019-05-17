class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode payload, 'my$ecretK3y', 'HS256'
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode token, 'my$ecretK3y', true, { algorithm: 'HS256' }
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      meetup_id = decoded_token[0]['meetup_id']
      @current_user = User.find_by(meetup_id: meetup_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end