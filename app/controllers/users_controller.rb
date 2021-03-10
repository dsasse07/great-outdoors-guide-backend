class UsersController < ApplicationController
  before_action :authenticate, only: [:show, :update]

  # POST /login
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      token = JsonWebToken.encode({ user_id: user.id })
      render json: { user: UserSerializer.new(user), token: token }
    else
      render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    end
  end

  # POST /signup
  def signup
    
    user = User.create(user_params)
    if user.valid?
      token = JsonWebToken.encode({ user_id: user.id })
      render json: { user: UserSerializer.new(user), token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /me
  def show
    render json: @current_user
  end

  # PATCH /show
  def update
    if @current_user.authenticate(params[:current_password])
      @current_user.update(first_name: params[:firstName], last_name: params[:lastName])
      @current_user.update(password: params[:new_password]) if params[:new_password]
      render json: @current_user
    else
      render json: { errors: ["Current Password Incorrect"] }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:username, :first_name, :last_name, :password)
  end

end