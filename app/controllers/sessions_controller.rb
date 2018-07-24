class SessionsController < ApplicationController
	def login_page
		redirect_to "/admin" if authed
		render layout: false
	end

	def login
		if login_cred(params[:username], params[:password])
			session[:authed] = true
			redirect_to "/admin"
		else
			redirect_to "/login"
		end
	end
end