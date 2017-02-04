var Body = React.createClass({

  getInitialState() {
    return { mentors: []}
  },

  componentDidMount() {
    $.getJSON('/api/v1/mentors.json', (response) => { this.setState({ mentors: response }) });
  },

  searchIdeas(query){
     let mentors = this.props.mentors.filter((mentors) => {
       return mentor.name.includes(query) || mentor.company.includes(query)
     });
     console.log(mentors)
   },

  render() {
    return (
      <div className="row">
        <div className="col s10 push-s2">
          <AllMentors mentors={this.state.filteredMentors || this.state.mentors} />
        </div>
        <div className="col s2 pull-s10">
          <SearchMentors searchIdeas={this.searchIdeas.bind(this)}/>
        </div>
      </div>
    )
  }
});
