var MentorShow = React.createClass({
  getInitialState(){
    return {mentor:{}}
  },

  componentDidMount() {
    let id = this.props.id;
    $.getJSON(`/api/v1/mentors/${id}`, function(mentor){
      console.log(mentor);
      this.setState({mentor: mentor});
    }.bind(this));
  },

  render() {
    let mentor = this.state.mentor;
    return (
       <div>
         <div className="container">
           <h1>Mentor Show Page</h1>
            <div className="row">
              <div className="col s4">
                <span>
                  <img className="mentor-pic-icon" src={mentor.avatar} />
                </span>
           <h3>{mentor.name}</h3>
           <p>Last Active: {mentor.last_active} </p>
         </div>

             <div className="col s6">
               <div className="container">
                 <p>Location: {mentor.location} </p>
                 <p>Company: {mentor.position} @ {mentor.company} </p>
                 <p>Position: {mentor.position} </p>
                 <p>Expertise: {mentor.expertise}</p>
                 <p>About Me: {mentor.bio} </p>
                 <p>Email: {mentor.email} </p>
                 <p>Slack: {mentor.slack} </p>
                 <p>Available: {" " +mentor.active} </p>
                </div>
              </div>
           </div>
         </div>
       </div>

    )
  }
});
