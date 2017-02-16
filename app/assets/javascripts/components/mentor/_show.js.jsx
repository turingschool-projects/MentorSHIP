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
         <div className="container center-align">
           <h1>Mentor Show Page</h1>
           <span className='mentor-picture col s12'>
             <img src={mentor.avatar} />
           </span>
           <h3 className="col s12">{mentor.name}</h3>
           <p>Last Active: {mentor.last_active} </p>
           <p>Location: {mentor.location} </p>
           <p>Company: {mentor.position} @ {mentor.company} </p>
           <p>Email: {mentor.email} </p>
           <p>Slack: {mentor.slack} </p>
           <p>Expertise: {mentor.expertise}</p>
           <p>Position: {mentor.position} </p>
           <p>Bio: {mentor.bio} </p>
         </div>
       </div>

    )
  }
});
