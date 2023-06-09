class RegistrationsController < ApplicationController
	def new
		@user = User.new

	end
	def create 
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_path, notice: "Signed Up successfully."
		else
			render :new
		end
	end
	private
	def user_params
		params.require(:user).permit(:citizen_id, :fullname, :gender, :date_of_birth, :address, :contact_number, :password, :password_confirmation)
	end
end
