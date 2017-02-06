var Body = React.createClass({

  handleClick() {

    $.ajax({
      url: '/auth/census',
      type: 'GET'
    });
  },

  render() {
    return (
      <div>
        <div id="welcome_message">
          <h1>Log in with your Census info!</h1>
        </div>

        <div id="login_values">
          <button onClick={() => this.handleClick()}>Log In</button>
        </div>
      </div>
    )
  }
});
