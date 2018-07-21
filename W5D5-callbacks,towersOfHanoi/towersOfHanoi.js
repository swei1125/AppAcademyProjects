const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output:process.stdout
});


class Game {
  constructor(towers) {
    this.towers = towers;
  }

  promptMove(makeMove) {
    this.print(this.towers);

    reader.question("where you want to take a disc from?", (start) => {
        reader.question("where you want to move a disc to?", (end) => {
            makeMove(start, end);
        });
      }
    );
  }

  isValidMove(start, end) {
    if (this.towers[start].length > 0) {
      if ((this.towers[end].length === 0) || (this.towers[start][0] < this.towers[end][0])) {
        return true;
      }
    }
    return false;
  }

  move(start, end) {
    if (this.isValidMove(start, end)) {
      let disc = this.towers[start].shift();
      this.towers[end].unshift(disc);
      return true;
    }

    return false;
  }

  print(towers) {
    JSON.stringify(towers);
  }

  isWon() {
    if (this.towers[0].length === 0) {
      if ((this.towers[1].length === 0)||(this.towers[2].length === 0)) {
        return true;
      }
    }
    return false;
  }

  run(completionCallback) {
    // this.promptMove(this.move);

    this.promptMove((start, end) => {
      if (!this.move(start, end)) {
        console.log("Invalid move!");
      }

      if (!this.isWon) {
        this.run(completionCallback);
      }else {
        this.print();
        console.log("You win!");
        completionCallback();
      }
    });
  }

}



let g = new Game([[1,2,3],[],[]]);

reader.close();
