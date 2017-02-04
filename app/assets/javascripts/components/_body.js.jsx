var Body = React.createClass({
  getInitialState() {
    return { mentors: [] }
  },

  componentDidMount() {
    $.getJSON('/api/v1/mentors.json', (response) => { this.setState({ mentors: response }) });
  },

  render() {
    return (
      <div>
        <AllMentors mentors={this.state.mentors} />
      </div>
    )
  }
});
