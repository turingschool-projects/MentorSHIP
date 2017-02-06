var AboutBody = React.createClass({
  render() {
    return (
      <div className="container ">
        <div id="about-container">
          <div className="row">
            <div className="col s4 about_anchor">
              <img src={"assets/about-cartoon-anchor.png"} />
              <p>
                They say you don't truelly know something until you teach it.
                Signing up offers unique oppurtunity to being a mentor to a budding
                software developer reap the the rewards of polishing your skills, staying current
                and teaching the paying it forwards.
              </p>
            </div>
            <div className="col s4 about_pirate">
              <img src={"assets/about-cartoon-pirate-parrot.png"} />
              <p>
                As a student at Turing one of the lessons is maximizing your use
                of resources, having a mentor is key because it offers insights
                into the world of development, help when you need it, support and
                perspective.

              </p>
            </div>
            <div className="col s4 about-parrot">
              <img src={"assets/about-cartoon-treasure-chest.png"} />
              <p>
                The reward for the mentor relationship is two fold, it rewards
                the mentor with a sense of leadership. It provides valuable insights
                for the mentee and helps both improve their skills, bot in asking
                and answering questions.
              </p>
            </div>
          </div>
        </div>
      </div>
    )
  }
});
