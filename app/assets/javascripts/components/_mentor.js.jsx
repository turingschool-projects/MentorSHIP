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
      <div>
        <div className="col s4">
          <div className='mentor-picture'>
              <p> {this.props.mentor.avatar}</p>
          </div>
          {name}
          <div className='mentor-company'>
              <p><strong>Company:</strong> {this.props.mentor.company}</p>
          </div>
          <div className='mentor-position'>
              <p>Position:{this.props.mentor.position}</p>
          </div>
        </div>
      </div>
    )
  }
});
