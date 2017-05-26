class Api::V1::FavoriteMentorsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    render json: FavoriteMentor.all
  end

  def create
    binding.pry
  end

end
