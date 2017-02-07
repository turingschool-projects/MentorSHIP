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
      return mentor.name.toLowerCase().includes(query) || mentor.location.toLowerCase().includes(query) || mentor.expertise.toLowerCase().includes(query) || mentor.company.toLowerCase().includes(query) || mentor.bio.toLowerCase().includes(query)
    });
    this.setState({mentors: mentors})
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
      </div>
      </div>
    )
  }
});
