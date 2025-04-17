class AuthController < ApplicationController
  def signup
    user = User.new(user_params)
    if user.save
      token = JWT.encode({ user_id: user.id }, jwt_secret)
      render json: { token: token }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, jwt_secret)
      render json: { token: token, user: user }
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:auth).permit(:name, :email, :password)
  end

  def jwt_secret
    Rails.application.credentials.secret_key_base || ENV["JWT_SECRET"] || "fallback_secret"
  end
end
