class MentorsController < ApplicationController
  before_action :authorize

  def index
  end

  def show
    id = params[:id]
    mentor = Mentor.find(params[:id])
    skills = mentor.skills
    render component: 'MentorShow', props: { id: id, skills: skills}
  end
end
