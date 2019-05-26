class Api::V1::GroupsController < ApplicationController
  require 'pry'
  require 'uri'
  before_action :authorized

  def fetch_user_groups_info
    access_token = @current_user.access_token
    header = {Authorization: "Bearer #{access_token}"}
    resp = RestClient.get("https://api.meetup.com/self/groups", header)
    response = JSON.parse(resp.body)
    make_groups(response)
    render json: @current_user.groups
  end

  def make_groups(groups)
    groups.each do |group|
      @group = Group.from_json(group)
      Member.where(
        user_id: @current_user.id,
        group_id: @group.id).first_or_create
    end
  end

  def users
    @meetup_group = Group.find_by_meetup_group_id(params[:group_id])
    @group_users = @meetup_group.users

    render json: @group_users
  end

end

  # def fetch_events(group)
  #   access_token = @current_user.access_token
  #   header = {Authorization: "Bearer #{access_token}"}
  #   resp = RestClient.get("https://api.meetup.com/#{group.name.parameterize}/events", header)
  #   response = JSON.parse(resp.body)
  #   make_events(response, group)

    # response.each do |event|
    #   @event = Event.from_json(event)

    #   group.events.first_or_create(@event)
    #   end
  # end

  # def make_events(events, group)
  #   events.each do |event|
  #     @event = Event.from_json(event)

  #     group.events.first_or_create(@event)
  #   end
  # end