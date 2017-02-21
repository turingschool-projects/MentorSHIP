var Edit = React.createClass({
  buttonStatus(){
    document.getElementById('acceptingButton').disabled = false;
  },

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
          <h5><div className="welcome-edit">Welcome {mentor.first_name}! Thanks for checking out Turing MentorSHIP.</div> <div className="edit-instructions">Please enter the rest of your information in order to accept mentees.</div></h5>
            <div className="row">
              <div className="col s4">
                <img src={mentor.avatar} className='dashboard-pic'/>
                <form>
                  <p>
                   <input type="checkbox" id="acceptingButton" disabled="disabled"/>
                   <label htmlFor="acceptingButton">Accepting Students</label>
                  </p>
                  </form>
                  <p><em>This won't be checkable until you fill in all fields on this form.</em></p>
              </div>
              <div className="col s6">
                <div className="form-area">
                  <div className="container-form">
                    <h6><span className="edit-headers">First Name:</span> {mentor.first_name} </h6>
                    <h6><span className="edit-headers">Last Name:</span> {mentor.last_name} </h6>
                    <h6><span className="edit-headers">Slack:</span> {mentor.slack} </h6>
                    <h6><span className="edit-headers">Email:</span> {mentor.email} </h6>
                    <h6><span className="edit-headers">Bio:</span></h6>
                    <input type='text' className="inputField" onChange={ (e) => this.setState({ bio: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" />
                    <h6><span className="edit-headers">Company:</span></h6>
                    <input type='text' className="inputField" onChange={ (e) => this.setState({ company: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" />
                    <h6><span className="edit-headers">Position:</span></h6>
                    <input type='text' className="inputField" onChange={ (e) => this.setState({ position: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" />
                    <h6><span className="edit-headers">Location:</span></h6>
                    <input type='text' className="inputField" onChange={ (e) => this.setState({ location: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" />
                    <h6><span className="edit-headers">Expertise:</span></h6>
                    <input type='text' className="inputField" onKeyUp={this.buttonStatus} onChange={ (e) => this.setState({ expertise: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" />
                  </div>
                </div>
                  <div className="edit-submit-button"><button onClick={this.handleEdit}> Submit </button></div>
              </div>
            </div>

          </div>
      </div>
    )

  }
});
