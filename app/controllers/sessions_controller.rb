class SessionsController < ApplicationController
	def new
		@email = ""
	end

	def create
		@email = params[:email]
		user = User.find_by_email(@email)
		if user && user.authenticate(params[:password])
			user.remember_token = SecureRandom.hex(16)
			session[:remember_token] = user.remember_token
			user.save!
			redirect_to user_path(user)
		else
			flash.now[:login_error] = "The credentials entered are invalid."
			render :back
		end
	end

	def destroy
		logout
		redirect_to login_path
	end
end
