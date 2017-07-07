class DashboardController < ApplicationController
  before_action :eligible

  def edit
    render component: "Edit", props: {mentorId: params[:id]}
  end
end
