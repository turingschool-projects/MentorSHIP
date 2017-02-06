var Navbar = React.createClass({
  render() {
    return (
      <nav>
       <div class="nav-wrapper">
         <a href="/" class="brand-logo">MENTORSHIP</a>
         <ul id="nav-mobile" class="right hide-on-med-and-down">
           <li><a href="/">Home</a></li>
           <li><a href="/about">How It Works</a></li>
         </ul>
       </div>
      </nav>
    )
  }
});
