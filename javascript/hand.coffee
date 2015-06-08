class Hand
	constructor: (@bet = 0) ->
		@cards = []
		@playable = false

	addCard: (card) ->
		@cards.push card
		return

	discardCard: (removeCard = @cards[0]) ->
		while (ax = @cards.indexOf removeCard) != -1
			@cards.splice(ax, 1);

		return @cards



