class Api::V1::GroupsController < ApplicationController
  require 'pry'
  before_action :authorized

  def fetch_user_groups_info
    access_token = @current_user.access_token
    header = {Authorization: "Bearer #{access_token}"}
    resp = RestClient.get("https://api.meetup.com/self/groups", header)
    response = JSON.parse(resp.body)
    make_groups(response)
    # binding.pry
  end

  def make_groups(groups)
    groups.each do |group|
      @group = Group.from_json(group)

      UserGroup.where(
        user_id: @current_user.id,
        group_id: @group.id).first_or_create
    end
  end

end