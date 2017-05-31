var MentorSkill = React.createClass({
  getInitialState: function() {
    return { value: "All"}
  },

  skillName(){
    skills = this.props.skills

    return skills.forEach(function(skill){
      $('#skill-list)'.append(skill.name)
    })
  },

  render() {
    return (
    <tr><td>{this.skillName()}</td></tr>
  )}
});
