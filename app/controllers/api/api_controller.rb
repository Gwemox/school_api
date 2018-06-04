class Api::ApiController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :require_login!
  layout false

  def require_login!
    if authentication_success?
      return true
    else
      render json: {errors: "Access denied"}, status: 401
    end
  end

  private

  def authentication_success?
    token = request.headers['Authorization']
    if token && !token.blank?
      user = User.find_by(auth_token: token)
      if user
        sign_in(user)
        return true
      end
    end
    return false
  end
end
