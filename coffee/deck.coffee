class Deck
	constructor: (packs = 1,@jokers = false) ->
		@cards = []
		@discarded = []
		for [0...packs]
			for suit in Card.Suits
				for rank in Card.Ranks
					@cards.push new Card(suit,rank)

		@shuffle()
		@remaining = @cards.length

	shuffle: () ->
		for i in [(@cards.length - 1)...0]
			temp = @cards[i]
			swapIndex = Math.floor(Math.random() * i)
			@cards[i] = @cards[swapIndex]
			@cards[swapIndex] = temp

		return

	deal: () ->
		@remaining = @remaining = @cards.length
		return @cards.pop()

	burn: (number = 1) ->
		for [0...number]
			@discarded.push @deal()

	discard: (card) ->
		@discarded.push card
		return

	addCards: (cards) ->
		@cards.push cards
		@remaining = @remaining = @cards.length
		return

	reshuffle: () ->
		@addCards(@discarded)
		@discarded = []
		@shuffle