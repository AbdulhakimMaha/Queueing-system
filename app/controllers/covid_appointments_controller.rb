class CovidAppointmentsController < ApplicationController
	def new
		@covid = Covid.new
		puts @covid.inspect + "from new"
	end
	def create
		puts "before create hits!!!!!!!!!!!!!!!!!"
		@covid = Current.user.covids.create(covid_params)
		puts "after create hits!!!!!!!!!!!!!!!!!"
		if @covid.save
			puts "create hits!!!!!!!!!!!!!!!!!"
			redirect_to home_path, notice: "Create appointment successfully."
		else
			puts "error create hits!!!!!!!!!!!!!!!!!"
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
