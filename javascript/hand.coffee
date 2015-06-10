class Hand
	constructor: (@bet = 0) ->
		@cards = []
		@playable = false

	addCard: (cards) ->
		if cards instanceof Card then @cards.push cards else @cards = @cards.concat cards
		return

	discardCard: (removeCard = @cards[0]) ->
		while (ax = @cards.indexOf removeCard) != -1
			@cards.splice(ax, 1);

		return @cards

	show: () ->
		for card in @cards
			card.show()


