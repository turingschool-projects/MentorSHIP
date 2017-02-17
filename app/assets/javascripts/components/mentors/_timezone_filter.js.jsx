var TimezoneFilter = React.createClass({
  getInitialState: function(){
    return { value: "All"}
  },
  handleChange(event) {
    this.state = {value: event.target.value};
    this.props.filterMentorsByTimezone(event.target.value)
  },

  render (){
    return(
      <div>
        <br></br>
        <span className="filter-mentors">
          By Timezone:
        </span>
        <label>
          <select value={this.state.value} onChange={this.handleChange}>
            <option value="All">All</option>
            <option value="Pacific">Pacific</option>
            <option value="Mountain">Mountain</option>
            <option value="Central">Central</option>
            <option value="Eastern">Eastern</option>
          </select>
        </label>
      </div>
    )
  }
});
