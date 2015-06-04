class Deck
	constructor: (decks = 1) ->
		@cards = []
		@discarded = []
		while (decks -= 1) + 1
			for suit in Suits
				for rank in Ranks
					@cards.push new Card(suit,rank)

		@shuffle()

	shuffle: () ->
		i = @cards.length
		while i -= 1
			temp = @cards[i]
			swapIndex = Math.floor(Math.random() * i)
			@cards[i] = @cards[swapIndex]
			@cards[swapIndex] = temp

		return

	deal: () ->
		return @cards.pop()

	discard: (card) ->
		@discarded.push card
		return

	addCards: (cards) ->
		@cards.push cards
		return