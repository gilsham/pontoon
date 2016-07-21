var Card;

Card = (function() {
  function Card(suit, rank) {
    this.suit = suit;
    this.rank = rank;
    this.visible = false;
    this.showen = Card.HiddenCard;
    this.build();
    return this;
  }

  Card.prototype.show = function() {
    this.visible = true;
    this.showen = this.element;
  };

  Card.prototype.hide = function() {
    this.visible = false;
    this.showen = Card.HiddenCard;
  };

  Card.prototype.build = function() {
    var i, j, rankLetter, ref, ref1, top;
    this.element = $('<div class="card ' + this.suit + ' r' + this.rank + '"></div>');
    switch (false) {
      case !$.isNumeric(this.rank):
        this.element.append($('<div>').addClass('number').text(this.rank));
        for (i = j = 0, ref = (top = parseInt(this.rank, 10)); 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
          this.element.append($("<div>").addClass('symbol' + (top / 2 < i ? ' flipped' : '')));
        }
        this.element.append($('<div>').addClass('number flipped').text(this.rank));
        break;
      case (ref1 = this.rank) !== 'Ace' && ref1 !== 'Jack' && ref1 !== 'Queen' && ref1 !== 'King':
        rankLetter = this.rank.slice(0, 1);
        this.element.append($('<div>').addClass('number').text(rankLetter));
        this.element.append($('<div>').addClass('symbol'));
        this.element.append($('<div>').addClass('number flipped').text(rankLetter));
    }
  };

  Card.Suits = ['Heart', 'Spade', 'Diamond', 'Club'];

  Card.Ranks = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King'];

  Card.HiddenCard = $('<div>').addClass('card hidden');

  return Card;

})();

//# sourceMappingURL=card.js.map