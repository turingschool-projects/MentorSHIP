class DashboardController < ApplicationController

  def edit
    token = User.find(params[:id]).token
    user = CensusService.new(token).get_user
    @user = [] << user
    render component: "Edit", props: {user: @user}
  end

end
