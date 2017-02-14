var MentorShow = React.createClass({
  render() {
    let mentor = this.props.mentor;
    return (
      <div>
        <div className="container center-align">
          <h1>Mentor Show Page</h1>
          <span className='mentor-picture col s12'>
            <img src={mentor.avatar} />
          </span>
          <h3 className="col s12">{mentor.name}</h3>
          <p>Last Active: {mentor.last_active} </p>
          <p>Location: {mentor.location} </p>
          <p>Company: {mentor.position} @ {mentor.company} </p>
          <p>Email: {mentor.email} </p>
          <p>Slack: {mentor.slack_username} </p>
          <p>Expertise: {mentor.expertise}</p>
          <p>Position: {mentor.position} </p>
          <p>Bio: {mentor.bio} </p>
        </div>
      </div>
    )
  }
});
