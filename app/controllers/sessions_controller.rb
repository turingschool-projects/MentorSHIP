class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])
    redirect_to "http://localhost:4200"
  end
end
