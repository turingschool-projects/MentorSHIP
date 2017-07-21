class MentorsController < ApplicationController
  def index
  end

  def show
    render component: 'MentorShow', props: { id: params[:id] }
  end

  def new
    @mentor = Mentor.new
  end

  def create
    @mentor = Mentor.create(mentor_params)
    # @mentor.declare_timezone(params[:mentor][:timezone])

    redirect_to dashboard_path(@mentor)
  end

  private

  def mentor_params
    params.require(:mentor).permit(:id, :first_name, :last_name, :expertise, :location, :position, :bio, :company, :timezone_id)
  end


end
