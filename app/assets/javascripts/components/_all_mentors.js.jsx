var AllMentors = React.createClass({

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
