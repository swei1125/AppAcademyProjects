const View = require('./ttt-view.js');// require appropriate file
const Game = require('../../solution/game.js');// require appropriate file

$( () => {
  // Your code here
  const game = new Game();
  const view = new View(game,$('.ttt'));
  view.bindEvents();
});
