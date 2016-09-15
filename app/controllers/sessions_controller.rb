class SessionsController < ApplicationController
  def create
    if @user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = @user.id
      cookies[:session_id] = session[:session_id]
      cookies[:token] = @user.token
      cookies[:email] = @user.email
      cookies[:authenticated] = true;
    else
      session.clear
      cookies[:session_id] = ""
      cookies[:token] = ""
      cookies[:email] = ""
      cookies[:authenticated] = false;
    end
      # redirect_to "http://localhost:4200/welcome"(session_id: 1, name: "Fred")

      redirect_to "http://localhost:4200/welcome"
  end
end
