class SessionsController < ApplicationController

  def create
    census_user_info = env["omniauth.auth"]
    user = User.find_or_create_by(id: census_user_info["uid"])
    user.token = census_user_info['info']['token']
    user.census_id = census_user_info['uid']
    user.save
    session[:user_id] = user.id
    if student?(census_user_info)
      redirect_to mentors_path
    else
      redirect_to edit_dashboard_path(user)
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def student?(census_user_info)
    census_user_info[:info][:roles].any?{|role| role[:name] == 'active student'}
  end

end
