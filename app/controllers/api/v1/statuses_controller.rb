class Api::V1::StatusesController < ApplicationController
  require 'pry'
  require 'uri'
  before_action :authorized

  def add_new
    @meetup_group = Group.find_by_meetup_group_id(params[:group_id])
    @status = Status.from_json(status)
    @new_status = UserGroupStatus.where(
        user_id: @current_user.id,
        group_id: @meetup_group.id).first_or_create
    end

    render json: @new_status
  end

end