class Api::V1::UsersController < ApplicationController
  require 'pry'
  before_action :authorized

  def profile
    render json: @current_user
  end

end
