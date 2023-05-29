class HomeController < ApplicationController
  helper_method :find_user

  def find_user(user_id)
    # puts user_id.to_s + "id from view"
    user = User.find_by(id: user_id)
    # puts username + "here"
    return user.fullname
  end

  def index
    if Current.user
      if Current.user.role == 1
        @covids = Covid.all
        render :admin
      else
        @covids = Current.user.covids
      end
    else
      redirect_to root_path
    end
  end
end
