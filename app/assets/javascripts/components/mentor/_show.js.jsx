var MentorShow = React.createClass({
  getInitialState(){
    return {mentor:{}}
  },

  componentDidMount() {
    let id = this.props.id;
    let skills = this.props.skills
    let skillName = skills.forEach(function (skill) {

      if (skill.skill_type == "Technical") {
        let tableRef = document.getElementById("Technical")
        $(tableRef).append(`<tr><td>${skill.name}</td></tr>`);
      } else if (skill.skill_type == "Non-Technical") {
        let tableRef = document.getElementById("Non-Technical")
        $(tableRef).append(`<tr><td>${skill.name}</td></tr>`);
      } else if (skill.skill_type == "Languages & Frameworks") {
        let tableRef = document.getElementById("Languages & Frameworks")
        $(tableRef).append(`<tr><td>${skill.name}</td></tr>`);
      }
    })

    $.getJSON(`/api/v1/mentors/${id}`, function(mentor){
      console.log(mentor);
      this.setState({mentor: mentor});
    }.bind(this));
  },

  // getMentorSkills() {
  //   // let skills = this.props.skills
  //   // this.setState({skills:skills})
  //
  // },

  render() {
    let mentor = this.state.mentor
    return (
       <div>
         <div className="container">
           <h1 id="mentor-show-header">Mentor Show Page</h1>
            <div className="row">
              <div className="col s4">
                <span>
                  <img className="mentor-pic-icon" src={mentor.avatar} />
                </span>
           <h3 id="mentor-show-name">{mentor.name}</h3>
         </div>
             <div className="col s6">
               <div className="container">
               <div className="form-area-show">
                 <h6 id="location-show-header"><span className="edit-headers">Location:</span> {mentor.location} </h6>
                 <h6><span className="edit-headers">Last Active: </span> {mentor.last_active} </h6>
                 <h6><span className="edit-headers">Company: </span> {mentor.position} @ {mentor.company} </h6>
                 <h6><span className="edit-headers">Position: </span> {mentor.position} </h6>
                 <h6><span className="edit-headers">Expertise: </span>  {mentor.expertise}</h6>
                 <h6><span className="edit-headers">About Me: </span> {mentor.bio} </h6>
                 <h6><span className="edit-headers">Email: </span> {mentor.email} </h6>
                 <h6><span className="edit-headers">Slack: </span>  {mentor.slack} </h6>
                 <h6><span className="edit-headers">Available: </span>  {" " +mentor.active} </h6>
                </div>
              </div>
           </div>
         </div>
         <br/>
         <br/>
           <div className='skills-table'>
             <h4> Skills</h4>
             <table id="Technical" className='each-table'>
              <thead>
                <tr>
                  <th className='table-center'>Technical</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
             </table>

             <table id="Non-Technical" className='each-table'>
              <thead>
                <tr>
                  <th className='table-center'>Non-Technical</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
             </table>

             <table id="Languages & Frameworks" className='each-table'>
              <thead>
                <tr>
                  <th className='table-center'>Languages & Frameworks</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
             </table>
           </div>
         </div>
       </div>

    )
  }
});
