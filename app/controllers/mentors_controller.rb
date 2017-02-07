class MentorsController < ApplicationController
  def index
  end

  def show
    mentor = Mentor.find(params[:id])
    render component: 'MentorShow', props: { mentor: mentor }
  end

end
