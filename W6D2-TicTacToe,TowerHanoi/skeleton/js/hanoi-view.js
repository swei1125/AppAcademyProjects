class View {
  constructor(hanoiGame, $el) {
    this.game = hanoiGame;
    this.setupTowers($el);

    this.clickTower();
    this.render();
  }

  setupTowers($el) {
    for (let i = 0; i < 3; i++) {
      const $tower = $("<ul></ul>");
      $tower.addClass("tower-" + (i + 1));
      $tower.data("pos", i + 1); //i + 1
      $el.append($tower);
    }

    const $uls = $('ul');
    $uls.each( (idx, ul) => {
      for (let i = 0; i < 3; i++) {
        const $disk = $("<li></li>");

        $disk.data("size", i + 1);
        if($(ul).data("pos") === 1) $disk.addClass("disk-" + (i + 1));

        $(ul).append($disk);
      }
    });
  }

  render() {

  }

  clickTower() {
    $(".hanoi ul").on("click", (e) => {
      const $startTower = e.currentTarget;
      const $start = $($startTower).data("pos");
      console.log($start);
      console.log($startTower);

      $(".hanoi ul").on("click", (e) => {
        const $endTower = e.currentTarget;
        const $end = $($endTower).data("pos");
        console.log($end, $endTower);

        if ( this.game.isValidMove($start, $end) ) {
          const $lis = $('.tower-' + $start + ' li');
          // console.log($lis);
        }
      });
    });
  }

}

module.exports = View;
