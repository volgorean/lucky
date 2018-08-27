class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
  attr_accessor :current_user
  
  def authenticated?
    unless current_user
      render json: {error: "Failed to authenticate!"}.to_json, status: 401
    end
  end

  def current_user
    header = request.headers['Authorization']

    return nil unless header && header.match(/^Bearer /)
    token = header.gsub(/^Bearer /, '')
    id = JsonWebToken.decode(token).dig(0, "user_id")

    @current_user ||= User.find_by(id: id)
  end
end
