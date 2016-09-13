class SessionsController < ApplicationController
  def create
    if @user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = @user.id
    end
    if session
      session_params = {session_id: session[:session_id], name: @user.name}
    else
      session_params = {session_id: "", name: nil}
    end
    redirect_to "http://localhost:4200/welcome", params: session_params
  end
end
