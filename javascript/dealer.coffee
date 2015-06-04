class Dealer extends Player
	constructor: (name, hand, @deck) ->
		super(name, hand)

		return @