class Api::V1::StudentsController < Api::V1::BaseController
  def index
    @students = Student.all
  end
end
