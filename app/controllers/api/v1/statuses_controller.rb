class Api::V1::StatusesController < ApplicationController
  require 'pry'
  require 'uri'
  before_action :authorized

  def add_new
    @meetup_group = Group.find_by_meetup_group_id(params[:groupId])
    @status = Status.from_json(params[:status])
    @new_status = UserGroupStatus.where(
        user_id: @current_user.id,
        group_id: @meetup_group.id,
        status_id: @status.id).first_or_create

    render json: @status
    # binding.pry
  end

  def fetch
    @meetup_group = Group.find_by_meetup_group_id(params[:group_id])
    @user_group_status = UserGroupStatus.find_by(
      group_id: @meetup_group.id,
      user_id: @current_user.id
    )
    @status = Status.find_by_id(@user_group_status.status_id)
# binding.pry
    render json: @status
  end

end