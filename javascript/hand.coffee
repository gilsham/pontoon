class Hand
	constructor: () ->
		@cards = []

	addCard: (card) ->
		@cards.push card
		return

	discardCard: (removeCard) ->
		while (ax = @cards.indexOf removeCard) != -1
			@cards.splice(ax, 1);

		return @cards

	
