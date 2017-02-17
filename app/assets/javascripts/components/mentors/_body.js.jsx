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

  filterMentorsByTimezone(timezone){
    if (timezone == "All") {
      return this.state.allMentors
    } else {
      let mentors = this.state.allMentors.filter((mentor)=> {
        debugger;
        return mentor.timezone.name === timezone
      })
      this.setState({mentors: mentors})
    }
  },

  render() {
    return (
    <div>
      <div className="row">
        <div className="col s10 push-s2">
          <AllMentors mentors={this.state.mentors} />
        </div>
        <div className="col s2 pull-s10">
          <SearchMentors searchMentors={this.searchMentors}/>
        </div>
        <div className= "col s2 pull-s10">
          <TimezoneFilter filterMentorsByTimezone={this.filterMentorsByTimezone}/>
        </div>
      </div>
    </div>
    )
  }
});
