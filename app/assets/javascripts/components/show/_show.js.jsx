var Show = React.createClass({
  componentWillMount() {
    console.log(this.props.mentor[0].name)
  },

  render() {
    return (
      <div>
        <Navbar />
        <div className="container center-align">
          <h1>Mentor Show Page</h1>
          <span className='mentor-picture col s12'>
           <img src={this.props.mentor[0].avatar} />
          </span>
          <h3 className="col s12">{this.props.mentor[0].name}</h3>
          <p>Location: {this.props.mentor[0].location} </p>
          <p>Company: {this.props.mentor[0].position} @ {this.props.mentor[0].company} </p>
          <p>Email: {this.props.mentor[0].email} </p>
          <p>Slack: {this.props.mentor[0].slack_username} </p>
          <p>Expertise: {this.props.mentor[0].expertise}</p>
          <p>Position: {this.props.mentor[0].position} </p>
          <p>Bio: {this.props.mentor[0].bio} </p>
          <p>Last Active: {this.props.mentor[0].last_active} </p>

        </div>
      </div>
    )
  }
});
