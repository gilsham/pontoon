class Player
	constructor: (@name,hand,@money) ->

		@hands = []
		@hands.push hand
		@actions = Pontoon.actions