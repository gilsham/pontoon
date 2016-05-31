class Player
	constructor: (@name,@money) ->

		@hands = []
		@active = true

		@board = $('<div>').text(@name).data('name',@name).css({border:'1px solid #000',padding:'0.5em'})
		$(() => $('#stuff').append @board; return)
		return @

	updateBoard: () ->