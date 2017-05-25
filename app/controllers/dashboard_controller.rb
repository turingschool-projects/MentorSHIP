class DashboardController < ApplicationController
  def edit
    render component: "Edit", props: {mentorId: params[:id]}
  end
end
