class Api::V1::MentorsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    render json: Mentor.all
  end

  def show
    render json: Mentor.find(params[:id])
  end

  def update
    CensusService.new.update_census(current_user.census_id, census_params)
    user = User.find(params[:id])
    user.update(user_params)
    user.mentor.update(mentor_params)
    user.mentor.profile_complete = true
    binding.pry
    user.save
  end

  private

  def user_params
    params.require(:user).permit(:bio)
  end

  def mentor_params
    params.require(:user).permit(:company, :position, :location, :expertise, :active)
  end

  def census_params
    params.require(:user).permit(:first_name, :last_name, :slack, :email)
  end

end
