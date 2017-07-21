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
    flash.now[:alert] = "you made a mentor"
  end

  private

  def mentor_params
    binding.pry
  end
end
