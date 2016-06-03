class Player
	constructor: (@name,@money) ->

		@hands = []
		@active = true

		@board = $('<div>').text(@name).data('name',@name).addClass('player')
		$(() => $('#stuff').append @board; return)
		return @

	updateBoard: () ->