class DashboardController < ApplicationController

  def edit
    token = User.find(params[:id]).token
    user = CensusService.new(token).get_user
    @user = [] << user
    render component: "Edit", props: {user: @user}
    # call to github service with token we received
    # within service, get user data from census
    # display data in forms on view
    # prompt user to fill in additional forms and hit submit

  end

end
