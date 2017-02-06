class MentorsController < ApplicationController
  def index
  end

  def show
    mentor = Mentor.find(params[:id])
    @mentor = [] << mentor
    render component: 'Show', props: { mentor: @mentor }
  end


end
