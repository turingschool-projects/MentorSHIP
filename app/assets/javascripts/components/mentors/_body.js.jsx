var Body = React.createClass({

  getInitialState() {
    return { mentors: []}
  },

  componentDidMount() {
    $.getJSON('/api/v1/mentors.json', (response) => { this.setState({ mentors: response, allMentors: response }) });
  },

  searchMentors(query){
    query = query.toLowerCase();
    let mentors = this.state.allMentors.filter((mentor) => {
      searchableMentorsInfo = mentor.name.toLowerCase() + mentor.location.toLowerCase() + mentor.expertise.toLowerCase() + mentor.company.toLowerCase() + mentor.bio.toLowerCase()
      return searchableMentorsInfo.includes(query)
    });
    this.setState({mentors: mentors})
  },

  filterMentorsByGender(gender){
    if (gender == "All") {
      return this.setState({mentors: this.state.allMentors})
    } else {
      let mentors = this.state.allMentors.filter((mentor) => {
        return mentor.gender === gender
      })



      this.setState({mentors: mentors})
    }
  },

  filterMentorsByTimezone(timezone){
    if (timezone == "All") {
      return this.setState({mentors: this.state.allMentors})
    } else {
      let mentors = this.state.allMentors.filter((mentor)=> {
        return mentor.timezone === timezone
      })
      this.setState({mentors: mentors})
    }
  },

  filterMentorsByAcceptingStudents(accepting){
    if (accepting == "All") {
      return this.setState({mentors: this.state.allMentors})
    } else {
      let mentors = this.state.allMentors.filter((mentor)=> {
        return (mentor.active + "") === accepting
      })
      this.setState({mentors: mentors})
    }
  },

  render() {
    return (
    <div>
      <div className="row">
        <div className="col s10 push-s2">
          <AllMentors mentors={this.state.mentors} currentUserId={this.props.currentUserId} />
        </div>
        <div className="col s2 pull-s10">
          <SearchMentors searchMentors={this.searchMentors}/>
        </div>
        <div className= "col s2 pull-s10">
          <TimezoneFilter filterMentorsByTimezone={this.filterMentorsByTimezone}/>
        </div>
        <div className= "col s2 pull-s10">
          <GenderFilter filterMentorsByGender={this.filterMentorsByGender}/>
        </div>
        <div className= "col s2 pull-s10">
          <AcceptingStudentsFilter filterMentorsByAcceptingStudents={this.filterMentorsByAcceptingStudents}/>
        </div>
      </div>
    </div>
    )
  }
});
