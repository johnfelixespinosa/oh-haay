class Api::V1::GroupsController < ApplicationController
  require 'pry'
  before_action :authorized

  def fetch_user_groups_info
    access_token = @current_user.access_token
    header = {Authorization: "Bearer #{access_token}"}
    resp = RestClient.get("https://api.meetup.com/self/groups", header)
    response = JSON.parse(resp.body)
    render json: response

    # name = user_info[:name]
    # meetup_id = user_info[:meetup_id]
    # meetup_profile_url = user_info[:meetup_profile_url]
    # photo_url = user_info[:photo_url]
    # city = user_info[:city]
  end

end

# def fetch_meetup_user_info(access_token)
#   header = {Authorization: "Bearer #{access_token}"}
#   resp = RestClient.get("https://api.meetup.com/2/member/self", header)
#   JSON.parse(resp.body)
# end