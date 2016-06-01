class Card
	constructor: (@suit, @rank) ->
		@visible = false

	show: () ->
		@visible = true
		return

	draw: () ->
		output = $("<div class='card " + if @visible then @suit + " " + @rank else "" + "'></div>")
		switch
			when $.isNumeric( @rank )
				output.append('<div>').class('number').text(@rank).clone()
				for 1...parseInt( @rank, 10 )
					output.append("<div>").addClass('symbol')
			when @rank in ['Ace','Jack','Queen','King']
				rankLetter = @rank.slice(0,1)
				output.append('<div>').class('number').text(@rankLetter).clone()
				output.append("<div>").addClass('symbol')

		return output


Suits = [
	'Heart'
	'Spade'
	'Diamond'
	'Club'
]

Ranks = [
	'Ace'
	'2'
	'3'
	'4'
	'5'
	'6'
	'7'
	'8'
	'9'
	'10'
	'Jack'
	'Queen'
	'King'
]