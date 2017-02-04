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
        {name}

        <div className='mentor-company'>
            <p><strong>Company:</strong> {this.props.mentor.company}</p>
        </div>

        <div className='mentor-position'>
            <p><strong>Position:</strong> {this.props.mentor.position}</p>
        </div>

      </div>
    )
  }
});
