class Api::V1::StudentsController < Api::V1::BaseController
  def index
    render json: Student.where(profile_completed: true)
  end

  def show
    render json: Student.find(params[:id])
  end
end
