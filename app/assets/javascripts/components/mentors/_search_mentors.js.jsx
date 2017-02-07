var SearchMentors = React.createClass({
  handleSearch(event) {
    this.props.searchMentors(event.target.value)
  },

  render (){
    return(
      <div>
        <span className="filter-mentors">
          Filter Mentors:
        </span>
        <div className="filter-input">
          <input type="text" onKeyUp={this.handleSearch}/>
        </div>
      </div>
    )
  }
});
