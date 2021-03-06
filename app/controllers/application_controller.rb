class ApplicationController < ActionController::API

  def authenticate
    @current_user = AuthorizeRequest.new(request.headers).user
    byebug
    if @current_user.nil?
      render json: { errors: ["Not Authorized"] }, status: :unauthorized
    end
  end


end
