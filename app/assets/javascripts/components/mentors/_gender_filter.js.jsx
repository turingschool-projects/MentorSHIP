var GenderFilter = React.createClass({
  getInitialState: function(){
    return { value: "All"}
  },
  handleGenderChange(event) {
    this.state = {value: event.target.value};
    this.props.filterMentorsByGender(event.target.value)
  },

  render (){
    return(
      <div>
        <br></br>
        <span className="filter-mentors">
          By Gender:
        </span>
        <label>
          <select value={this.state.value} onChange={this.handleGenderChange}>
            <option value="All">All</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
          </select>
        </label>
      </div>
    )
  }
});
