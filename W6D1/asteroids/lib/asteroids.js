const MovingObject = require('./moving_object.js');
const Util = require('./utils.js');

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;


function Asteroid(options) {
  // console.log(options);
  // this.pos = options.pos;
  // MovingObject.call(options.pos);
  MovingObject.call(this, {"pos": options.pos, "color":"green", "radius": 30, "vel": [Util.randomVec(10), Util.randomVec(10)]});

}

Util.inherits(Asteroid, MovingObject);

// ({"color":"green", "radius": 30, "vel": [Util.randomVec(10), Util.randomVec(10)]});