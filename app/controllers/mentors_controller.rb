class MentorsController < ApplicationController
  def index
    mentor = Mentor.where(profile_complete: true)
  end

  def show
    mentor = Mentor.find(params[:id])
    render component: 'MentorShow', props: { mentor: mentor }
  end

end
