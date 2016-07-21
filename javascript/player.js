var Player;

Player = (function() {
  function Player(name, money) {
    this.name = name;
    this.money = money;
    this.hands = [];
    this.active = true;
    this.board = $('<div>').text(this.name).data('name', this.name).addClass('player');
    $((function(_this) {
      return function() {
        $('#stuff').append(_this.board);
      };
    })(this));
    return this;
  }

  Player.prototype.updateBoard = function() {};

  return Player;

})();

//# sourceMappingURL=player.js.map