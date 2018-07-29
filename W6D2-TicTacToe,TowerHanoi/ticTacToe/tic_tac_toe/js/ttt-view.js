class View {
  constructor(game, $el) {
    this.game = game;
    this.setupBoard($el);
  }

  bindEvents() {
    const $grid = $(".grid");
    $grid.on("click", (event) => {
      event.preventDefault();

      const $cell = $(event.target);
      this.makeMove($cell);
    });
  }

  makeMove($square) {
    if (!$square.hasClass("cell")) {
      alert("Invalid move. Try again.");
    }

    const mark = this.game.currentPlayer;

    this.game.playMove($square.data("pos"));

    $square.addClass(mark);
    $square.removeClass("cell");
    $square.css("background-color", "white");
    $square.css("color", "black");

    if (this.game.isOver()) {
      $('li').css("background-color", "white");

      //green and white for winner
      //red and white for loser
      const winner = this.game.winner();
      $('.' + winner).css("background-color", "green");
      $('li').css("color", "red");
      $('.' + winner).css("color", "white");

      $(".grid").off("click");

      //display winning message
      const $message = $('<h2></h2>');
      $message.text("You win, " + winner + "!");
      $('body').append($message);
    }
  }

  setupBoard($el) {
    const $grid = $("<ul class='grid'></ul>");
    $el.append($grid);
    for (let i = 0; i < 9; i++) {
      const $cell = $("<li class='cell'></li>");
      $cell.data("pos", [ Math.floor(i / 3), (i % 3) ]);
      $grid.append($cell);
    }
  }
}

module.exports = View;
