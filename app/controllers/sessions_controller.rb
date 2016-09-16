class SessionsController < ApplicationController
  def create
    if @user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = @user.id
      cookies[:session_id] = session[:session_id]
      cookies[:token] = @user.token
      cookies[:email] = @user.email
      cookies[:authenticated] = true;
      redirect_to ENV['PATH_BASE'] + "/welcome"
    else
      destroy_session
    end
  end

  def destroy
    destroy_session
  end

  private
  def destroy_session
    session.clear
    cookies.delete :session_id
    cookies.delete :token
    cookies.delete :email
    cookies.delete :authenticated
    redirect_to ENV['PATH_BASE']
  end
end
