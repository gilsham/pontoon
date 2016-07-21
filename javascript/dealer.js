var Dealer,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Dealer = (function(superClass) {
  extend(Dealer, superClass);

  function Dealer(name, money, deck) {
    this.deck = deck;
    Dealer.__super__.constructor.call(this, name, money);
    return this;
  }

  Dealer.prototype.deal = function(number) {
    var cards, i, ref;
    if (number == null) {
      number = 1;
    }
    cards = [];
    if (this.deck.remaining < number) {
      this.deck.reshuffle();
      if (this.deck.remaining < number) {
        throw "Not enough cards";
      }
    }
    for (i = 0, ref = number; 0 <= ref ? i < ref : i > ref; 0 <= ref ? i++ : i--) {
      cards.push(this.deck.deal());
    }
    return cards;
  };

  return Dealer;

})(Player);

//# sourceMappingURL=dealer.js.map