class Game {
  
  constructor (towers) {
    this.towers = towers;
  }
  
  promptMove () {
    this.print(this.towers);
    const readline = require("readline");
    const reader = readline.createInterface({
      input: process.stdin,
      output: process.stdout
    });
    reader.question("Where do you want to take a disc from?", function (startTowerIdx) {console.log("hi");});
    reader.question("Where do you to move the disc to?", function (endTowerIdx) {console.log("hi");});
    reader.close();    
  }
  
  isValidMove(start, end) {
    if (this.towers[start].length > 0) {
      if ((this.towers[end].length === 0) || (this.towers[end][0] > this.towers[start][0])) {
        return true; 
      }
    }
    return false;
  }
  
  move(start, end) {
    if (this.isValidMove(start, end)) {
      let disc = this.towers[start].slice(0,1);
      this.towers[start] = this.towers[start].slice(1);
      this.towers[end].unshift(disc);
      this.print(this.towers);
      return true;
    } 
    console.log("Invalid move.");
    return false;
  }
  
  print() {
    return JSON.stringify(this.towers);
  }
  
  isWon() {
    if ((this.towers[0].length === 0) && ((this.towers[1].length === 0) || (this.towers[2].length === 0))) {
      return true;
    }
    return false;
  }
  
  run(completionCallback) {
    //until the 1st tower AND either the 2nd OR 3rd tower is empty
      //get move from player
      //check if move is valid
      //make move on the piles
    while (this.isWon() === false) {
      this.promptMove(function (from) {
      
        this.promptMove(function (end) {
          let move = this.move(from, end);
          if (!move) {
            console.log("invalid move");
          }
        });
      });
      
    }
      
  }
}

let game = new Game([[],[3],[1,2]]);
// console.log(game.print());
// console.log(game.move(0, 1));
console.log(game.run());