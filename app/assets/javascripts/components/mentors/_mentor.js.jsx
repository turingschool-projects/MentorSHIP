var Mentor = React.createClass({
  getInitialState() {
    return { editable: false };
  },

  // changeColor: function() {
  //   var colorTest = this.state.color == 'white' ? 'red' : 'white';
  //   var buttonInput = this.state.text == 'Favorite' ? 'Unfavorite' : 'Favorite';
  //     this.setState({color: colorTest, text: buttonInput})
  // },


  toggleFavorite: function () {
    var id_mentor = this.props.mentor.id;
    $.ajax({
     url: `/api/v1/student_mentors`,
     type: 'POST',
     data: {student_mentor: {mentor_id: id_mentor}},
     success: alert("You just favorited a Mentor")
   });

},

toggleUnFavorite: function () {
  var student_mentor_id = this.props.mentor.student_favorites[0].student_id;
  $.ajax({
    url: `/api/v1/student_mentors/${student_mentor_id}`,
    type: 'DELETE',
    success: alert("You just made a mentor cry")
  });


},


  render() {
    debugger
    return (
      <div className="col s4" style={{background: this.state.color}}>
        <span className='mentor-picture'>
         <img src={this.props.mentor.avatar} className="mentor-pic-icon" />
        </span>
        <h3><a href={"/mentors/" + this.props.mentor.id }>{this.props.mentor.name}</a></h3>
        <span className='mentor-company'>
            <p><strong>Company: </strong>{this.props.mentor.company}</p>
        </span>
        <span className='mentor-position'>
            <p><strong>Bio:  </strong>{this.props.mentor.bio}</p>
        </span>
        <span className='favorite-mentor'>
          <button onClick={this.toggleFavorite}>Favorite</button>
        </span>
        <span className='favorite-mentor'>
          <button onClick={this.toggleUnFavorite}>Unfavorite</button>
        </span>

      </div>
    )
  }
});
