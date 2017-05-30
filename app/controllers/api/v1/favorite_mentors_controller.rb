class Api::V1::FavoriteMentorsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    render json: FavoriteMentor.all
  end

  def create
    @user = current_user
    render json: FavoriteMentor.create(user_id: @user.id, mentor_id: favorite_mentor_params[:mentor_id])
  end

  def destroy
    @user = current_user
    @favorite_mentor = @user.favorite_mentors.find_by(params[:mentor_id])
    @favorite_mentor.destroy
  end

  private

  def favorite_mentor_params
    params.require(:favorite_mentor).permit(:user_id, :mentor_id)
  end

end
