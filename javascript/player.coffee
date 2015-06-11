class Player
	constructor: (@name,@money) ->

		@hands = []
		@active = true

		$('<div>').data('name',@name)