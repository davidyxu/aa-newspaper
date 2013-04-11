module SessionsHelper
	def current_user
		return nil if session[:remember_token].nil?
		@user ||= User.find_by_remember_token(session[:remember_token])
	end
	def logout
		unless current_user.nil?
			current_user.remember_token = nil
			current_user.save!
		end
		
		reset_session		
	end
end
