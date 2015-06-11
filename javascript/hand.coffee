class Hand
	constructor: (@bet = 0) ->
		@cards = []
		@playable = false

	addCard: (cards) ->
		if cards instanceof Card then @cards.push cards else @cards = @cards.concat cards
		@setPlayable
		return

	discardCard: (removeCard = @cards[0]) ->
		while (ax = @cards.indexOf removeCard) != -1
			@cards.splice(ax, 1);

		@setPlayable
		return @cards

	setPlayable: () ->
		@playable = @cards.length >= 2
		return

	show: () ->
		for card in @cards
			card.show()