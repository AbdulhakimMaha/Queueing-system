class CovidAppointmentsController < ApplicationController
	def new
		@covid = Covid.new
	end
	def create
		@covid = Current.user.covids.create(covid_params)
		if @covid.save
			redirect_to root_path, notice: "Create appointment successfully."
		else
			render :new
		end

	end

	def update
		puts param[:id]
		redirect_to home_path
	end

	private
	def covid_params
		params.require(:covid).permit(:test_date)
	end
end
