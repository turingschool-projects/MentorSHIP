var SearchMentors = React.createClass({

  handleSearch(event) {
    this.props.searchIdeas(event.target.value)
  },

  render (){
    return(
      <div>
      <label>Search</label>
        <input type="text" onKeyUp={this.handleSearch.bind(this)}/>
      </div>
    )
  }
});
