module ApplicationHelper
	def authed
		return false unless session[:authed]
		session[:authed]
	end

	def authenticate
	  redirect_to "/login" unless authed
	end

	def login_cred(user, pass)
		cu = ENV["ADMIN_USERNAME"] || "user"
		cp = ENV["ADMIN_PASSWORD"] || "pass"
		
		return true if cu == user && cp == pass
		return false
	end
end
