##Functionaility is still a WIP


# class Api::V1::EventsController < ApplicationController
#   require 'pry'
#   require 'uri'
#   before_action :authorized

#   def fetch_groups_events
#     access_token = @current_user.access_token
#     header = {Authorization: "Bearer #{access_token}"}

#     @current_user.groups.each do |group|
#       resp = RestClient.get("https://api.meetup.com/#{group.name.parameterize}/events", header)
#       response = JSON.parse(resp.body)
#       make_events(response, group)
#     end
#     render json: @current_user.groups
#   end

#   def make_events(events, group)
#     events.each do |event|
#       @event = Event.from_json(event)

#       group.events.first_or_create(@event)
#     end
#   end


# end