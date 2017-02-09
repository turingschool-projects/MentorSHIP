var Edit = React.createClass({

  handleUpdate(updatedInfo){
    let mentor = this.props.user[0];
    $.ajax({
     url: `/api/v1/mentors/${mentor.id}`,
     type: 'PATCH',
     data: {user: { bio: updatedInfo.bio, company: updatedInfo.company, position: updatedInfo.position, location: updatedInfo.location, expertise: updatedInfo.expertise }},
     success: console.log("yay")
   });
  },

  handleEdit() {
    var bio = this.state.bio;
    var company = this.state.company;
    var position = this.state.position;
    var location = this.state.location;
    var expertise = this.state.expertise;


    var updatedInfo = {bio: bio, company: company, position: position, location: location, expertise: expertise}
    this.handleUpdate(updatedInfo);
  },

  render() {
    let user = this.props.user[0];
    return (
      <div>

        <div className="container">
        <img src={user.image_url} />
          <form action="#">
    <p>
      <input type="checkbox" disabled="disabled"/>
      <label for="test5">Accepting Mentees</label>
    </p>
  </form>
        <p>Welcome {user.first_name}! Please enter the rest of your information in order to accept mentees.</p>
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
            defaultValue="Enter a bio" />
          <h5>Company:</h5>
           <input type='text' onChange={ (e) => this.setState({ company: e.target.value }) }
            defaultValue="Enter your company" />
          <h5>Position:</h5>
           <input type='text' onChange={ (e) => this.setState({ position: e.target.value }) }
            defaultValue="Enter your position" />
          <h5>Location:</h5>
             <input type='text' onChange={ (e) => this.setState({ location: e.target.value }) }
              defaultValue="Enter your location" />
            <h5>Expertise:</h5>
             <input type='text' onChange={ (e) => this.setState({ expertise: e.target.value }) }
              defaultValue="Enter your expertise" />
          <button onClick={this.handleEdit}> <a href="/mentors">Submit</a> </button>
        </div>
      </div>
    )
  }
});
