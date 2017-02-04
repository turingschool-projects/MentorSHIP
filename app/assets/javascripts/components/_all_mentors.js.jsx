var AllMentors = React.createClass({

  removeMentorFromDOM(id) {
     let newMentors = this.props.mentors.filter((mentor) => {
       return mentor.id != id;
     });
   },

  render() {
    let mentors = this.props.mentors.map((mentor, index) => {
      return (
        <div key={index}>
          <Mentor mentor={mentor}/>
        </div>
      )
    });

    return (
      <div>
        <div className="row">
        {mentors}
        </div>
      </div>
    )
  }
});
