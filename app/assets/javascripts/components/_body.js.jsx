var Body = React.createClass({
  getInitialState() {
    return { mentors: [] }
  },

  componentDidMount() {
    $.getJSON('/api/v1/mentors.json', (response) => { this.setState({ mentors: response }) });
  },

  render() {
    return (
      <div className="row">
        <div className="col s10 push-s2">
          <AllMentors mentors={this.state.mentors} />
        </div>
        <div className="col s2 pull-s10">
          <SearchMentors />
        </div>
      </div>
    )
  }
});
