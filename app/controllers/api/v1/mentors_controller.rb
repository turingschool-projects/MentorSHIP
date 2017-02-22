class Api::V1::MentorsController < Api::V1::BaseController
  def index
    @mentors = Mentor.where(profile_completed: true)
  end

  def show
    render json: Mentor.find(params[:id])
  end

  def update
    CensusService.new(current_user.token).update_census(current_user.census_id, census_params)
    user = User.find(params[:id])
    user.update(user_params)
    user.mentor.update(mentor_params)
    user.mentor.profile_complete = true
    user.save
  end

  private

  def user_params
    params.require(:user).permit(:bio)
  end
end
