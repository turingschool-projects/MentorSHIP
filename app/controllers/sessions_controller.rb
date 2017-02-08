class SessionsController < ApplicationController

  def create
    census_user_info = env["omniauth.auth"]
    user = User.find_or_create_by(id: census_user_info["uid"])
    user.token = census_user_info['info']['token']
    user.save
    redirect_to edit_dashboard_path(user)
  end

end
