class Dealer extends Player
	constructor: (name, hand, money, @deck) ->
		super(name, hand, money)

		return @

	deal: (number = 1) ->
		cards = []
		if @deck.remaining < number
			@deck.reshuffle()
			if @deck.remaining < number
				throw "Not enough cards"
		
		for [0...number]
				cards.push @deck.deal()
