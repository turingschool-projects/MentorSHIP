var LastNameFilter = React.createClass({
  getInitialState: function(){
    return { value: "All"}
  },
  handleLastNameChange(event) {
    this.state = {value: event.target.value};
    this.props.filterMentorsByAlphabet(event.target.value)
  },

  render (){
    return(
      <div>
        <br></br>
        <span className="filter-mentors">
          By Alphabet:
        </span>
        <label>
          <select value={this.state.value} onChange={this.handleLastNameChange}>
            <option value="All">All</option>
            <option value="A">a</option>
            <option value="B">b</option>
            <option value="C">c</option>
            <option value="D">d</option>
            <option value="E">e</option>
            <option value="F">f</option>
            <option value="G">g</option>
            <option value="H">h</option>
            <option value="I">i</option>
            <option value="J">j</option>
            <option value="K">k</option>
            <option value="L">l</option>
            <option value="M">m</option>
            <option value="N">n</option>
            <option value="O">o</option>
            <option value="P">p</option>
            <option value="Q">q</option>
            <option value="R">r</option>
            <option value="S">s</option>
            <option value="T">t</option>
            <option value="U">u</option>
            <option value="V">v</option>
            <option value="W">w</option>
            <option value="X">x</option>
            <option value="Y">y</option>
            <option value="Z">z</option>
          </select>
        </label>
      </div>
    )
  }
});
