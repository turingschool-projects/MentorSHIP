class Api::V1::MentorsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    render json: Mentor.where(profile_completed: true)
  end

  def show
    render json: Mentor.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    user.mentor.update(mentor_params)
  end

  private

    def user_params
      params.require(:user).permit(:bio)
    end

    def mentor_params
      params.require(:user).permit(:company, :position, :location, :expertise)
    end


end
