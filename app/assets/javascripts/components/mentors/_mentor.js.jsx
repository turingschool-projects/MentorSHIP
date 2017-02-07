var Mentor = React.createClass({
  getInitialState() {
    return { editable: false }
  },

  render() {
    return (
      <div className="col s4">
        <span className='mentor-picture'>
         <img src={this.props.mentor.avatar} />
        </span>
        <h3>{this.props.mentor.name}</h3>
        <span className='mentor-company'>
            <p><strong>Company: </strong>{this.props.mentor.company}</p>
        </span>
        <span className='mentor-position'>
            <p><strong>Bio:  </strong>{this.props.mentor.bio}</p>
        </span>
      </div>
    )
  }
});
