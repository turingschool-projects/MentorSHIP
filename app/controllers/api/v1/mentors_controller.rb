class Api::V1::MentorsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    render json: Mentor.all
  end

  def show
    mentor = Mentor.find_or_create_by(user_id: params[:id])

    render json: mentor.profile
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    mentor = Mentor.find_or_create_by(user_id: params[:id])
    mentor.update(mentor_params)
    mentor.profile_complete = true
    user.save
  end

  private

  def user_params
    params.require(:user).permit(:bio)
  end

  def mentor_params
    params.require(:user).permit(:company, :position, :location, :expertise, :active, :gender)
    .merge!({timezone_id: 1})
  end

  def census_params
    params.require(:user).permit(:first_name, :last_name, :slack, :email)
  end
end
