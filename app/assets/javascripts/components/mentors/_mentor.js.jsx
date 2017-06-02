var Mentor = React.createClass({
  getInitialState() {
    return { editable: false }
  },

  render() {
    return (
      <div className="col s4">
        <span className='mentor-picture'>
         <img src={this.props.mentor.avatar} className="mentor-pic-icon" />
        </span>
        <h3><a href={"/mentors/" + this.props.mentor.id }>{this.props.mentor.name}</a></h3>
        <span className='mentor-company'>
            <p><strong>Company: </strong>{this.props.mentor.company}</p>
        </span>
        <span className='mentor-position'>
            <p><strong>Bio: </strong>{this.props.mentor.bio}</p>
        </span>
      </div>
    )
  }
});
