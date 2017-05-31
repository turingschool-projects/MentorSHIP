var Edit = React.createClass({
  checkValues(){
    var bio = document.getElementById('bioField').value;
    var company = document.getElementById('companyField').value;
    var position = document.getElementById('positionField').value;
    var city = document.getElementById('cityField').value;
    var state = document.getElementById('stateField').value;
    var country = document.getElementById('countryField').value;
    var expertise = document.getElementById('expertiseField').value;
    if ([bio, company, position, city, expertise].includes("") === false && !(state == "" && country == "")) {
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
    let mentor = this.state.mentor;
    $.ajax({
     url: `/api/v1/mentors/${mentor.id}`,
     type: 'PATCH',
     data: {user: { active: true}},
     success: console.log.bind(this, "yay")
   });
  },

  handleUpdate(updatedInfo){
    let id = this.props.mentorId
    let mentor = {id: id};
    $.ajax({
     url: `/api/v1/mentors/${mentor.id}`,
     type: 'PATCH',
     data: { user: { bio: updatedInfo.bio, company: updatedInfo.company, position: updatedInfo.position, city: updatedInfo.city, state: updatedInfo.state, country: updatedInfo.country } },
     success: function(){ window.location = "/mentors"; }
   });
  },

  handleEdit(e) {
    e.preventDefault();
    var bio = this.state.bio;
    var company = this.state.company;
    var position = this.state.position;
    var city = this.state.city;
    var state = this.state.state;
    var country = this.state.country;
    var expertise = this.state.expertise;

    var updatedInfo = { bio: bio, company: company, position: position, city: city, state: state, country: country, expertise: expertise }
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
                    <input id="bioField" type='text' className="inputField" cols='50' rows='10' onKeyUp={this.checkValues} onChange={ (e) => this.setState({ bio: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" value={mentor.bio} />
                    <h6><span className="edit-headers">Company:</span></h6>
                    <input id="companyField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.setState({ company: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" value={mentor.company} />
                    <h6><span className="edit-headers">Position:</span></h6>
                    <input id="positionField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.setState({ position: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" value={mentor.position} />
                    <h6><span className="edit-headers">City:</span></h6>
                    <input id="cityField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.setState({ city: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" value={mentor.city} />
                    <h6><span className="edit-headers">State:</span></h6>
                    <input id="stateField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.setState({ state: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" value={mentor.state} />
                    <h6><span className="edit-headers">Country:</span></h6>
                    <input id="countryField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.setState({ country: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" value={mentor.country} />
                    <h6><span className="edit-headers">Expertise:</span></h6>
                    <input id="expertiseField" type='text' className="inputField" onKeyUp={this.checkValues} onChange={ (e) => this.setState({ expertise: e.target.value }) }
                      placeholder="Please Enter Your Information To Accept Mentees" value={mentor.expertise} />
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
