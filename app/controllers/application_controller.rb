class ApplicationController < ActionController::Base
  force_ssl
  protect_from_forgery with: :exception

  helper_method :current_user, :eligible, :is_eligible?, :authorize

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to root_path unless current_user
  end

  def eligible
    users = EligibleUser.eligible_users
    unless users.include?(current_user.census_id)
      redirect_to mentors_path
    end
  end

  def is_eligible?
    users = EligibleUser.eligible_users
    users.include?(current_user.census_id)
  end
end
