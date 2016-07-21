var Deck;

Deck = (function() {
  function Deck(packs, jokers) {
    var j, k, l, len, len1, rank, ref, ref1, ref2, suit;
    if (packs == null) {
      packs = 1;
    }
    this.jokers = jokers != null ? jokers : false;
    this.cards = [];
    this.discarded = [];
    for (j = 0, ref = packs; 0 <= ref ? j < ref : j > ref; 0 <= ref ? j++ : j--) {
      ref1 = Card.Suits;
      for (k = 0, len = ref1.length; k < len; k++) {
        suit = ref1[k];
        ref2 = Card.Ranks;
        for (l = 0, len1 = ref2.length; l < len1; l++) {
          rank = ref2[l];
          this.cards.push(new Card(suit, rank));
        }
      }
    }
    this.shuffle();
    this.remaining = this.cards.length;
  }

  Deck.prototype.shuffle = function() {
    var i, j, ref, swapIndex, temp;
    for (i = j = ref = this.cards.length - 1; ref <= 0 ? j < 0 : j > 0; i = ref <= 0 ? ++j : --j) {
      temp = this.cards[i];
      swapIndex = Math.floor(Math.random() * i);
      this.cards[i] = this.cards[swapIndex];
      this.cards[swapIndex] = temp;
    }
  };

  Deck.prototype.deal = function() {
    this.remaining = this.remaining = this.cards.length;
    return this.cards.pop();
  };

  Deck.prototype.burn = function(number) {
    var j, ref, results;
    if (number == null) {
      number = 1;
    }
    results = [];
    for (j = 0, ref = number; 0 <= ref ? j < ref : j > ref; 0 <= ref ? j++ : j--) {
      results.push(this.discarded.push(this.deal()));
    }
    return results;
  };

  Deck.prototype.discard = function(card) {
    this.discarded.push(card);
  };

  Deck.prototype.addCards = function(cards) {
    this.cards.push(cards);
    this.remaining = this.remaining = this.cards.length;
  };

  Deck.prototype.reshuffle = function() {
    this.addCards(this.discarded);
    this.discarded = [];
    return this.shuffle;
  };

  return Deck;

})();

//# sourceMappingURL=deck.js.map