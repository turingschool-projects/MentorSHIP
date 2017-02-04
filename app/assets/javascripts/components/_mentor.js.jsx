var Mentor = React.createClass({
  getInitialState() {
    return { editable: false }
  },

  render() {
    var name = this.state.editable ? <input type='text'
                                            ref='name'
                                            defaultValue={this.props.mentor.name} />
                                   : <h3>{this.props.mentor.name}</h3>

    return (
        <div className="col s4">
          <span className='mentor-picture'>
           <img src={this.props.mentor.avatar} />
          </span>
          {name}
          <span className='mentor-company'>
              <p><strong>Company: </strong>{this.props.mentor.company}</p>
          </span>
          <span className='mentor-position'>
              <p><strong>Position:  </strong>{this.props.mentor.position}</p>
          </span>
        </div>
    )
  }
});
