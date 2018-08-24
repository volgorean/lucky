class SessionsController < ApplicationController
	before_action :authenticated?, except: [:login]

	def login
    user = User.find_by(email: params[:email])

    # password is type BCrypt::Password
    if user && user.password == params[:password]
      render json: {
        user: {
          token: JsonWebToken.encode({
            user_id: user.id,
            created_at: Time.now.to_i
          })
        }
      }.to_json
    else
      render json: {error: "Failed to authenticate!"}.to_json, status: 401
    end
  end
end