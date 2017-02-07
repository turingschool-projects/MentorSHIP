class Api::V1::MentorsController < Api::V1::BaseController
  def index
    render json: Mentor.where(profile_completed: true)
  end

  def show
    render json: Mentor.find(params[:id])
  end
end
