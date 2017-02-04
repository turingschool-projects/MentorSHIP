var NewMentor = React.createClass({
getInitialState() {
return { name: '', details: '' }
},


  render() {
  return (
  <div>
    <input onChange={ (e) => this.setState({ name: e.target.value }) } placeholder='Enter name of skill' />
    <input onChange={ (e) => this.setState({ details: e.target.value }) } placeholder='Details' />
    <button>Submit</button>
  </div>
  )
  }
});
