var Mentor = React.createClass({
  getInitialState() {
    return { editable: false };
  },

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
  var student_mentor_id = this.props.mentor.student_favorites[0].id;
  $.ajax({
    url: `/api/v1/student_mentors/${student_mentor_id}`,
    type: 'DELETE',
    success: alert("You just made a mentor cry")
  });
},

  render() {
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
        <span style={{display: this.props.mentor.favorite === false ? "true" : "none"}}>
          <button onClick={this.toggleFavorite}>Favorite</button>
        </span>
        <span style={{display: this.props.mentor.favorite === true ? "true" : "none"}}>
          <button onClick={this.toggleUnFavorite}>UnFavorite</button>
        </span>

      </div>
    )
  }
});
