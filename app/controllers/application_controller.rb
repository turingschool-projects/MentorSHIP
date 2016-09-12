class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_name, :current_session

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_name
    if current_user
      current_user.name
    else
      ""
    end
  end

  def current_session
    if session
      session[:session_id]
    else
      ""
    end
  end
end
