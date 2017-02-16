class TimezoneFilter extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});
    this.props.filterMentorsByTimezone(event.target.value)

  }

  render (){
    return(
      <div>
        <select value={this.state.value} onChange={this.handleChange}>
          <option value="all">All</option>
          <option value="Pacific">Pacific</option>
          <option value="Mountain">Mountain</option>
          <option value="Central">Central</option>
          <option value="Eastern">Eastern</option>
        </select>
      </div>
    )
  }
};
