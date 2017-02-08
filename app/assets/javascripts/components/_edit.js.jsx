var Edit = React.createClass({

  handleUpdate(bio){
    let mentor = this.props.user[0];
    $.ajax({
     url: `/api/v1/mentors/${mentor.id}`,
     type: 'PATCH',
     data: { bio: bio },
     success: console.log("yay")
   });
  },

  handleEdit(user) {
    var bio = this.state.bio;
    var updatedUser = {bio: bio}
    this.handleUpdate(updatedUser);
  },

  render() {
    let user = this.props.user[0];
    return (
      <div>
        <Navbar />
        <div className="container">
        <p>Welcome {user.first_name}! Please enter the rest of your information to proceed.</p>
          <h5>First Name:</h5>
            <p>{user.first_name} </p>
          <h5>Last Name:</h5>
            <p>{user.last_name} </p>
          <h5>Slack:</h5>
            <p>{user.slack} </p>
          <h5>Email:</h5>
            <p>{user.email} </p>
          <h5>Bio:</h5>
           <input type='text' onChange={ (e) => this.setState({ bio: e.target.value }) }
            defaultValue="Enter a bio here" />
          <button onClick={this.handleEdit}> <a href="/mentors">Submit</a> </button>
        </div>
      </div>
    )
  }
});
