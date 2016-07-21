var Hand;

Hand = (function() {
  function Hand(bet) {
    this.bet = bet != null ? bet : 0;
    this.cards = [];
    this.playable = false;
  }

  Hand.prototype.addCard = function(cards) {
    if (cards instanceof Card) {
      this.cards.push(cards);
    } else {
      this.cards = this.cards.concat(cards);
    }
    this.setPlayable;
  };

  Hand.prototype.discardCard = function(removeCard) {
    var ax;
    if (removeCard == null) {
      removeCard = this.cards[0];
    }
    while ((ax = this.cards.indexOf(removeCard)) !== -1) {
      this.cards.splice(ax, 1);
    }
    this.setPlayable;
    return this.cards;
  };

  Hand.prototype.setPlayable = function() {
    this.playable = this.cards.length >= 2;
  };

  Hand.prototype.show = function() {
    var card, i, len, ref, results;
    ref = this.cards;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      card = ref[i];
      results.push(card.show());
    }
    return results;
  };

  return Hand;

})();

//# sourceMappingURL=hand.js.map