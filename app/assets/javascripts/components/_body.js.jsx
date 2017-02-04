var Body = React.createClass({
  getInitialState() {
    return { mentors: [] }
  },

  componentDidMount() {
    $.getJSON('/api/v1/mentors.json', (response) => { this.setState({ mentors: response }) });
  },

  handleSubmit(mentor) {
    let newState = this.state.mentors.concat(mentor);
    this.setState({ mentors: newState })
  },

  handleDelete(id) {
    $.ajax({
      url: `/api/v1/mentors/${id}`,
      type: 'DELETE',
      success: () => {
        this.removeIdeaFromDOM(id);
      }
    });
  },

  removeIdeaFromDOM(id) {
    let newSkills = this.state.mentors.filter((mentor) => {
      return mentor.id != id;
    });

    this.setState({ mentors: newSkills });
  },

  handleUpdate(mentor) {
    $.ajax({
      url: `/api/v1/mentors/${skill.id}`,
      type: 'PUT',
      data: { mentor: mentor },
      success: (mentor) => {
        this.updateMentors(mentor)
      }
    });
  },

  updateMentors(mentor) {
    let mentors = this.state.mentors.filter((s) => { return s.id != mentor.id });
    mentors.push(mentor);

    this.setState({ mentors: mentors });
  },

  render() {
    return (
      <div>
        <NewMentor handleSubmit={this.handleSubmit} />
        <AllMentors mentors={this.state.mentors}
                   handleDelete={this.handleDelete}
                   onUpdate={this.handleUpdate} />
      </div>
    )
  }
});
