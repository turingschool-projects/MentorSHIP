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
      <div className="container">
        <div className="edit-page">
        <h5>Welcome {user.first_name}! Please enter the rest of your information in order to accept mentees.</h5>
          <div className="row">
            <div className="col s4">
              <img src={user.image_url} className='dashboard-pic'/>
              <form action="#">
                <p>
                  <input type="checkbox" disabled="disabled"/>
                  <label for="test5">Accepting Mentees</label>
                </p>
              </form>
            </div>
          <div className="col s6">
          <h6><span className="edit-headers">First Name:</span> {user.first_name} </h6>
          <h6><span className="edit-headers">Last Name:</span> {user.last_name} </h6>
          <h6><span className="edit-headers">Slack:</span> {user.slack} </h6>
          <h6><span className="edit-headers">Email:</span> {user.email} </h6>
          <h6><span className="edit-headers">Bio:</span></h6>
           <input type='text' onChange={ (e) => this.setState({ bio: e.target.value }) }
            defaultValue="Enter your bio" />
          <h6><span className="edit-headers">Company:</span></h6>
           <input type='text' onChange={ (e) => this.setState({ company: e.target.value }) }
            defaultValue="Enter your company" />
          <h6><span className="edit-headers">Position:</span></h6>
           <input type='text' onChange={ (e) => this.setState({ position: e.target.value }) }
            defaultValue="Enter your position" />
          <h6><span className="edit-headers">Location:</span></h6>
             <input type='text' onChange={ (e) => this.setState({ location: e.target.value }) }
              defaultValue="Enter your location" />
            <h6><span className="edit-headers">Expertise:</span></h6>
             <input type='text' onChange={ (e) => this.setState({ expertise: e.target.value }) }
              defaultValue="Enter your expertise" />
          <button onClick={this.handleEdit}> <a href="/mentors">Submit</a> </button>
          </div>
        </div>
        </div>
      </div>
    )
  }
});
