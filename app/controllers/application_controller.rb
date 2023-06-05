class ApplicationController < ActionController::Base
	before_action :set_current_user


	def set_current_user
		# puts "without sign in 65615615615615616516156156 15615615615616515615616516 165156156156156156156156156"
		if session[:user_id]
			# puts "65615615615615616516156156 15615615615616515615616516 165156156156156156156156156"
			Current.user = User.find_by(id: session[:user_id])
		end
	end
end
