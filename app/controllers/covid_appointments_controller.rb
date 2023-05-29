class CovidAppointmentsController < ApplicationController
	def new
		@covid = Covid.new
	end
	def create
		@covid = Current.user.covids.create(covid_params)
		if @covid.save
			redirect_to home_path, notice: "Create appointment successfully."
		else
			render :new
		end

	end

	def update_to_pending
		covid = Covid.find(params[:id])
		# puts covid.status
		covid.update(actual_test_date: Time.now, status: "pending")

		# puts covid.pending!


		# if covid.status.to_i < 3
		# 	# covid.update(status: s)
		# else
		# 	# covid.update(status: 0)
		# end
		puts covid.status

		redirect_to home_path, notice: "Status update successfully."
	end

	private
	def covid_params
		params.require(:covid).permit(:test_date)
	end
end
