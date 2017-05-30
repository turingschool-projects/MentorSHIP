var Mentor = React.createClass({
  getInitialState() {
    return { editable: false, favorite: 'white' }
  },

  // changeColor: function() {
  //   var fav = this.state.favorite == 'white' ? 'red' : 'white';
  //   this.setState({favorite: fav})
  // },
  toggleFavorite: function () {
    //
    //
    // debugger
    var id_mentor = this.props.mentor.id;
    $.ajax({
     url: `/api/v1/favorite_mentors`,
     type: 'POST',
     data: {favorite_mentor: {mentor_id: id_mentor}},
     success: alert("You just favorited a Mentor")
   });

},

  toggleUnFavorite: function () {
    //
    //
    // debugger
    var id_mentor = this.props.mentor.id;
    $.ajax({
     url: `/api/v1/favorite_mentors/${id_mentor}`,
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
        <span className='favorite-mentor'>
          <button onClick={this.toggleFavorite} style={{backgroundColor:this.state.favorite}}><i class="material-icons">add</i></button>
        </span>
        <span className='unfavorite-mentor'>
          <button onClick={this.toggleUnFavorite} style={{backgroundColor:this.state.favorite}}>UNFavorite</button>
        </span>

      </div>
    )
  }
});
