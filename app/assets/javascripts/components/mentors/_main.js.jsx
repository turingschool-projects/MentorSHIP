var Main = React.createClass({
  render() {
    return (
      <div>
        <Header title={'Mentors'}/>
        <Body currentUserId={this.props.current_user_id} />
      </div>
    )
  }
});
