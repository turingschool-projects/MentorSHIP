class Api::V1::StudentsController < Api::V1::BaseController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end
end
