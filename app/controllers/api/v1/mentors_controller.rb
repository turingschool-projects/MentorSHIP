class Api::V1::MentorsController < Api::V1::BaseController
  def index
    @mentors = Mentor.where(profile_completed: true)
  end

  def show
    @mentor = Mentor.find(params[:id])
  end
end
