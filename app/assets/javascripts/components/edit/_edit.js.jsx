var Edit = React.createClass({
  checkValues(){
    var bio = document.getElementById('bioField').value;
    var company = document.getElementById('companyField').value;
    var position = document.getElementById('positionField').value;
    var location = document.getElementById('locationField').value;
    var expertise = document.getElementById('expertiseField').value;
    if (([bio, company, position, location, expertise].includes("")) === false) {
      this.buttonStatus();
    }
  },

  buttonStatus(){
    document.getElementById('acceptingButton').disabled = false;
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
    let mentor = {id:this.props.mentorId};
    $.ajax({
     url: `/api/v1/mentors/${mentor.id}`,
     type: 'PATCH',
     data: {user: { active: true}},
     success: console.log.bind(this, "yay")
   });
  },

  handleUpdate(updatedInfo){
    let mentor = {id:this.props.mentorId};
    $.ajax({
     url: `/api/v1/mentors/${mentor.id}`,
     type: 'PATCH',
     data: {user: { bio: updatedInfo.bio, company: updatedInfo.company, position: updatedInfo.position, location: updatedInfo.location, expertise: updatedInfo.expertise, first_name: updatedInfo.first_name, last_name: updatedInfo.last_name, email: updatedInfo.email, slack: updatedInfo.slack }},
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
    var first_name = this.state.first_name;
    var last_name = this.state.last_name;
    var slack = this.state.slack;
    var email = this.state.email;


    var updatedInfo = {bio: bio, company: company, position: position, location: location, expertise: expertise, first_name: first_name, last_name: last_name, slack: slack, email: email }
    this.handleUpdate(updatedInfo);
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
                   <input type="checkbox" id="acceptingButton" disabled="disabled"/>
                   <label htmlFor="acceptingButton">Accepting Students</label>
                  </p>
                  </form>
                  <p><em>This won't be checkable until you fill in bio, company, position, and expertise on this form.</em></p>
              </div>
              <div className="col s6">
                <div className="form-area">
                  <div className="container-form">
                    <h6><span className="edit-headers">First Name:</span></h6>
                    <input type='text' className="inputField census-data" onChange={ (e) => this.setState({ first_name: e.target.value }) }
                     placeholder={mentor.first_name} />
                    <h6><span className="edit-headers">Last Name:</span></h6>
                    <input type='text' className="inputField census-data" onChange={ (e) => this.setState({ last_name: e.target.value }) } placeholder={mentor.last_name} />
                    <h6><span className="edit-headers">Slack:</span></h6>
                    <input type='text' className="inputField census-data" onChange={ (e) => this.setState({ slack: e.target.value }) } placeholder={mentor.slack} />
                    <h6><span className="edit-headers">Email:</span></h6>
                    <input type='text' className="inputField census-data" onChange={ (e) => this.setState({ email: e.target.value }) } placeholder={mentor.email} />
                    <h6><span className="edit-headers">Bio:</span></h6>
                    <input id="bioField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.setState({ bio: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" />
                    <h6><span className="edit-headers">Company:</span></h6>
                    <input id="companyField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.setState({ company: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" />
                    <h6><span className="edit-headers">Position:</span></h6>
                    <input id="positionField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.setState({ position: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" />
                    <h6><span className="edit-headers">Location:</span></h6>
                    <input id="locationField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.setState({ location: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" />
                    <h6><span className="edit-headers">Expertise:</span></h6>
                    <input id="expertiseField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.setState({ expertise: e.target.value }) }
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
