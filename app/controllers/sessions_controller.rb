class SessionsController < ApplicationController
	def new

	end
	
	def create
		user = User.find_by(citizen_id: params[:citizen_id].to_i)
		if user.present? && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to home_path, notice: "Logged in successfully."
		else
			flash[:alert] = "Invalid Citizen ID or password."
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: "Logout successfully."
	end
end
