class Card
	constructor: (@suit, @rank) ->
		@visible = false
		@showen = Card.HiddenCard
		@build()

		return @

	show: () ->
		@visible = true
		@showen = @element
		return

	hide: () ->
		@visible = false
		@showen = Card.HiddenCard
		return

	build: () ->
		@element = $( '<div class="card ' + @suit + ' r' + @rank + '"></div>' )
		switch
			when $.isNumeric( @rank )
				@element.append( $('<div>').addClass('number').text(@rank) )
				for i in [0...(top = parseInt( @rank, 10 ))]
					@element.append( $("<div>").addClass('symbol'+ if top/2 < i then ' flipped' else '') )
				@element.append($('<div>').addClass('number flipped').text(@rank))
			when @rank in ['Ace','Jack','Queen','King']
				rankLetter = @rank.slice(0,1)
				@element.append( $('<div>').addClass('number').text(rankLetter) )
				@element.append( $('<div>').addClass('symbol') )
				@element.append( $('<div>').addClass('number flipped').text(rankLetter) )

		return


	@Suits = [
		'Heart'
		'Spade'
		'Diamond'
		'Club'
	]

	@Ranks = [
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

	@HiddenCard = $('<div>').addClass('card hidden')