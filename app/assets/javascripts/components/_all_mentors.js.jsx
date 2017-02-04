var AllMentors = React.createClass({
  handleDelete(id) {
    this.props.handleDelete(id);
  },

  onUpdate(mentor) {
    this.props.onUpdate(mentor);
  },

  render() {
    let mentors = this.props.mentors.map((mentor, index) => {
      return (
        <div key={index}>
          <Mentor mentor={mentor}
                 handleDelete={this.handleDelete.bind(this, mentor.id)}
                 handleUpdate={this.onUpdate}/>
        </div>
      )
    });

    return (
      <div>
        {mentors}
      </div>
    )
  }
});
