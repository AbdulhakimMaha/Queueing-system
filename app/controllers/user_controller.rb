class UserController < ApplicationController
  def index
    @user = User.find_by(id: Current.user.id)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    puts params[:user]
    @user = User.update(update_param)
    redirect_to user_path, notice: "update successfully."
  end

  def edit_password
    @user = Current.user
    render :edit_password
  end

  def change_password
    @user = User.find_by(id:params[:id])
    if @user.present? && @user.authenticate(params[:user][:old_password])
      @user.update(update_pass)
      redirect_to home_path, notice: "Update password sucessfully"
    else
			flash[:alert] = "Invalid old password or new password didn't match"
      render :edit_password
    end
  end

  private
  def update_param
		params.require(:user).permit(:citizen_id, :fullname, :gender, :date_of_birth, :address, :contact_number)
  end
  def update_pass
    params.require(:user).permit(:password, :password_confirmation)
  end
end
