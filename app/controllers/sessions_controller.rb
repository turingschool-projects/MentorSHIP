class SessionsController < ApplicationController

  def create
    binding.pry
    census_user_info = env["omniauth.auth"]
  end

end
