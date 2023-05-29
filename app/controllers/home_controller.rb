class HomeController < ApplicationController
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
