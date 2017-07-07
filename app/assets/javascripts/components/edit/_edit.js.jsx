var Edit = React.createClass({
  checkValues(){
    var bio = document.getElementById('bioField').value;
    var company = document.getElementById('companyField').value;
    var position = document.getElementById('positionField').value;
    var location = document.getElementById('locationField').value;
    var expertise = document.getElementById('expertiseField').value;
    var gender = document.getElementById('genderField').value;
    if (([bio, company, position, location, expertise].includes("")) === false) {
      this.handleProfileCompleteChange(true)
    }else{
      this.handleProfileCompleteChange(false)
    }
  },

  getInitialState(){
    return {mentor:{}}
  },

  componentDidMount() {
    $.getJSON(`/api/v1/mentors/${this.props.mentorId}`, function(mentor){
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
    })
    .fail((failure) => {
      console.log(failure)
    })
  },

  handleUpdate(updatedInfo){
    let id = this.props.mentorId
    let mentor = {id: id};
    $.ajax({
     url: `/api/v1/mentors/${mentor.id}`,
     type: 'PATCH',
     data: { user: { bio: updatedInfo.bio, company: updatedInfo.company, position: updatedInfo.position, location: updatedInfo.location, expertise: updatedInfo.expertise, gender: updatedInfo.gender, active: updatedInfo.active, profile_complete: updatedInfo.profile_complete } },
     success: function(){ window.location = "/mentors"; }
   });
  },

  handleEdit(e) {
    e.preventDefault();
    var bio = this.state.mentor.bio;
    var company = this.state.mentor.company;
    var position = this.state.mentor.position;
    var location = this.state.mentor.location;
    var expertise = this.state.mentor.expertise;
    var gender = this.state.mentor.gender;
    var active = this.state.mentor.active;
    var profile_complete = this.state.mentor.profile_complete;

    var updatedInfo = { bio: bio, company: company, position: position, location: location, expertise: expertise, gender: gender, active: active, profile_complete: profile_complete }
    this.handleUpdate(updatedInfo);
  },

  handleBioChange(e) {
    let mentor = this.state.mentor;
    mentor.bio = e.target.value;
    this.setMentorChange(mentor)
  },

  handleCompanyChange(e) {
    let mentor = this.state.mentor;
    mentor.company = e.target.value;
    this.setMentorChange(mentor)
  },

  handlePositionChange(e) {
    let mentor = this.state.mentor;
    mentor.position = e.target.value;
    this.setMentorChange(mentor)
  },

  handleLocationChange(e) {
    let mentor = this.state.mentor;
    mentor.location = e.target.value;
    this.setMentorChange(mentor)
  },

  handleExpertiseChange(e) {
    let mentor = this.state.mentor;
    mentor.expertise = e.target.value;
    this.setMentorChange(mentor)
  },

  handleGenderChange(e) {
    let mentor = this.state.mentor;
    mentor.gender = e.target.value;
    this.setMentorChange(mentor)
  },

  handleProfileCompleteChange(status) {
    let mentor = this.state.mentor;
    mentor.profile_complete = status;
    this.setMentorChange(mentor)
  },

  handleAcceptingStudentsChange(e) {
    let mentor = this.state.mentor;
    mentor.active = e.target.checked;
    this.setMentorChange(mentor)
  },

  setMentorChange(mentor) {
    this.setState({
      mentor,
    });
  },

  render() {
    let mentor = this.state.mentor;

    return (
      <div className="container">
        <div className="edit-page">
          <EditHeader />
            <div className="row">
              <div className="col s4">
                <img src={mentor.avatar} className='dashboard-pic'/>
                <form>
                  <p>
                   <input type="checkbox" id="acceptingButton" disabled={!mentor.profile_complete} onChange={ (e) => this.handleAcceptingStudentsChange(e) } checked={mentor.active}/>
                   <label htmlFor="acceptingButton">Accepting Students</label>
                  </p>
                  </form>
                  <p><em>This won't be checkable until you fill in all fields on this form.</em></p>
              </div>
              <div className="col s6">
                <div className="form-area">
                  <div className="censusInformation">
                    <table>
                      <tbody>
                        <tr>
                          <td><h6 className="edit-headers">First Name:</h6></td>
                          <td><a href={mentor.account_url} target="_blank">{mentor.first_name}</a></td>
                        </tr>
                        <tr>
                          <td><h6 className="edit-headers">Last Name:</h6></td>
                          <td><a href={mentor.account_url} target="_blank">{mentor.last_name}</a></td>
                        </tr>
                        <tr>
                          <td><h6 className="edit-headers">Slack:</h6></td>
                          <td><a href={mentor.account_url} target="_blank">{mentor.slack}</a></td>
                        </tr>
                        <tr>
                          <td><h6 className="edit-headers">Email:</h6></td>
                          <td><a href={mentor.account_url} target="_blank">{mentor.email}</a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div className="container-form">
                    <h6><span className="edit-headers">Bio:</span></h6>
                    <input id="bioField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.handleBioChange(e) } value={mentor.bio} />
                    <h6><span className="edit-headers">Company:</span></h6>
                    <input id="companyField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.handleCompanyChange(e) } value={mentor.company} />
                    <h6><span className="edit-headers">Position:</span></h6>
                    <input id="positionField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.handlePositionChange(e) } value={mentor.position} />
                    <h6><span className="edit-headers">Location:</span></h6>
                    <input id="locationField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.handleLocationChange(e) } value={mentor.location} placeholder="City, State, Country"/>
                    <h6><span className="edit-headers">Expertise:</span></h6>
                    <input id="expertiseField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.handleExpertiseChange(e) } value={mentor.expertise} />
                    <h6><span className="edit-headers">Gender:</span></h6>
                    <select id="genderField" value={mentor.gender} onChange={ (e) => this.handleGenderChange(e) }>
                      <option value=""></option>
                      <option value="female">Female</option>
                      <option value="male">Male</option>
                      <option value="other">Other</option>
                      <option value="n/a">I do not wish to disclose.</option>
                    </select>
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
