var Edit = React.createClass({
  getInitialState(){
    return {mentor:{}}
  },
  componentDidMount() {
    $.getJSON(`/api/v1/mentors/${this.props.mentorId}`, function(mentor){
      console.log(mentor);
      this.setState({mentor: mentor});
    }.bind(this));
  },
  handleClick() {
    let mentor = this.state.mentor;
    $.ajax({
     url: `/api/v1/mentors/${mentor.id}`,
     type: 'PATCH',
     data: {user: { active: true}},
     success: console.log.bind(this, "yay")
   });
  },

  handleUpdate(updatedInfo){
    let mentor = this.state.mentor;
    $.ajax({
     url: `/api/v1/mentors/${mentor.id}`,
     type: 'PATCH',
     data: {user: { bio: updatedInfo.bio, company: updatedInfo.company, position: updatedInfo.position, location: updatedInfo.location, expertise: updatedInfo.expertise }},
     success: function(){ window.location = "/mentors"; }
   });
  },

  handleEdit(e) {
    e.preventDefault();
    var bio = this.state.bio;
    var company = this.state.company;
    var position = this.state.position;
    var location = this.state.location;
    var expertise = this.state.expertise;


    var updatedInfo = {bio: bio, company: company, position: position, location: location, expertise: expertise}
    this.handleUpdate(updatedInfo);
  },

  render() {
    let mentor = this.state.mentor;

    return (
      <div className="container">
        <div className="edit-page">
          <h5>Welcome {mentor.first_name}! Please enter the rest of your information in order to accept mentees.</h5>
            <div className="row">
              <div className="col s4">
                <img src={mentor.avatar} className='dashboard-pic'/>

                <button onClick={this.handleClick}>Accepting Mentees</button>

              </div>
              <div className="col s6">
                <h6><span className="edit-headers">First Name:</span> {mentor.first_name} </h6>
                <h6><span className="edit-headers">Last Name:</span> {mentor.last_name} </h6>
                <h6><span className="edit-headers">Slack:</span> {mentor.slack} </h6>
                <h6><span className="edit-headers">Email:</span> {mentor.email} </h6>
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
                  <button onClick={this.handleEdit}> <a href="#">Submit</a> </button>
              </div>
            </div>
          </div>
      </div>
    )

  }
});
