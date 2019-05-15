class Authenticator
  def initialize(connection = Faraday.new)
    @connection = connection
  end

  def meetup(access_code)
    access_token_resp = fetch_meetup_access_token(access_code)
    access_token = access_token_resp['access_token']
    user_profile_resp = fetch_meetup_user_info(access_token)

    {
      issuer: ENV['FLASHCARDS_CLIENT_URL'],
      name: user_profile_resp['name'],
      meetup_id: user_profile_resp['id'],
      meetup_profile_url: user_profile_resp['meetup_profile_url'],
      photo_url: user_profile_resp['photo']['highres_link'],
      city: user_profile_resp['city']
    }
  end

  private

  def fetch_meetup_access_token(access_code)

    body = {
      client_id: Rails.application.credentials[:meetup][:client_id],
      client_secret: Rails.application.credentials[:meetup][:secret],
      grant_type: 'authorization_code',
      redirect_uri: "http://localhost:3001/api/v1/auth",
      code: access_code
    }
    auth_response = RestClient.post("https://secure.meetup.com/oauth2/access", body)
    JSON.parse(auth_response.body).to_h
  end

  def fetch_meetup_user_info(access_token)
    header = {Authorization: "Bearer #{access_token}"}
    resp = RestClient.get("https://api.meetup.com/2/member/self", header)
    JSON.parse(resp.body)
  end
end