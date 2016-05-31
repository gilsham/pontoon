class Card
	constructor: (@suit, @rank) ->
		@visible = false

	show: () ->
		@visible = true
		return


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