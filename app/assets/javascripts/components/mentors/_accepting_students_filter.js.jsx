var AcceptingStudentsFilter = React.createClass({
  getInitialState: function(){
    return { value: "All"}
  },
  handleChange(event) {
    this.state = {value: event.target.value};
    this.props.filterMentorsByAcceptingStudents(event.target.value)
  },

  render (){
    return(
      <div>
        <br></br>
        <span className="filter-mentors">
          By Accepting Mentees:
        </span>
        <label>
          <select value={this.state.value} onChange={this.handleChange}>
            <option value="All">All</option>
            <option value="true">Accepting</option>
            <option value="false">Not Accepting</option>
          </select>
        </label>
      </div>
    )
  }
});
