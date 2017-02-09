var Edit = React.createClass({
  render() {
    let user = this.props.user[0];
    return (
      <div>
        <p>{user.first_name}</p>
        <form>
          <label>
            Name:
            <input type="text" name="name" value="" />
          </label>
          <input type="submit" value="Submit" />
        </form>
      </div>
    )
  }
});
