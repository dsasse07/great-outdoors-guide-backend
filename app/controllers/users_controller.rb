class UsersController < ApplicationController
  before_action :authenticate, only: [:show]

  def show
    render json: @current_user
  end

end
