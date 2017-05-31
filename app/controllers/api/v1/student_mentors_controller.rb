class Api::V1::StudentMentorsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    render json: StudentMentor.all
  end

  def create
    @student = current_user.student
    render json: StudentMentor.create(student_id: @student.id, mentor_id: student_mentor_params[:mentor_id])
  end

  def destroy
    @student = current_user.student
    @student_mentor = @student.student_mentors.find_by(params[:mentor_id])
    @student_mentor.destroy
    binding.pry
  end

  def student_mentor_params
    params.require(:student_mentor).permit(:user_id, :mentor_id)
  end

end
