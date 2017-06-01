var Button = React.createClass({
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
  var student_mentor_id = this.props.mentor.student_favorites[0].student_id;
  $.ajax({
    url: `/api/v1/student_mentors/${student_mentor_id}`,
    type: 'DELETE',
    success: alert("You just made a mentor cry")
  });
},
