class MentorsController < ApplicationController
  def index
  end

  def show
    id = params[:id]
    # render component: 'MentorShow',
    render component: 'MentorShow', props: { id: id }
  end

end
