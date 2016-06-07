class Pontoon extends Game
	constructor: (dealer, playerDetails, @minBet = 1, @maxBet = 100) ->
		include Player,
			actions: Pontoon.actions

		include Hand,
			betRange: () => Pontoon.betRange.call(this)

		reinit = (player) =>
			if player.name == dealer
			then @dealer = new Dealer(player.name,player.money,new Deck 3)
			else new Player(player.name,player.money)
		players = (reinit player for player in playerDetails)

		super(players)

	start: () ->

		@startRound()


	activePlayers: () ->
		return (player for player in @players when player.active).length

	startRound: () ->
		if @dealer.deck.length < @activePlayers() * 5
			@dealer.deck.reshuffle()

		for player in @players
			if not player.playingHand
				player.hands.push( player.playingHand = new Hand() )

			player.playingHand.addCard @dealer.deal()
			player.playingHand.addCard @dealer.deal()

		for player in @players

			if player != @dealer
				player.playingHand.show()
			else
				player.playingHand.cards[0].show()

			for name, action of player.actions when action.canDo.call( player )
				button = $( '<button>' )
					.click( action.do.call( player ))
					.text( name )
					.appendTo( player.board )

		@update()

		return

	update: () ->
		for player in @players
			player.board.empty()
			for hand in player.hands
				handEle = $( '<div>' )
					.addClass( 'hand' + if hand == player.playingHand then ' playing' else '' )

				for card in hand.cards
					handEle.append( card.showen )

				player.board.append( handEle )
		return

	@cardValue: ( card ) ->
		switch card.rank
			when 'Ace' then return [ 1,11 ]

			when '2','3','4','5','6','7','8','9','10'
				return [ parseInt(card.rank,10) ]

			when 'Jack','Queen','King'
				return [ 10 ]

			else return NaN

	@betRange: ( hand ) ->
		{ min: @minBet }

	@actions:
		declare: new Action(
			() ->
				for card in @playingHand.cards
					if card.rank == 'Ace'
						card.show()
			() ->
				return (
						@playingHand.length < 3 &&
						(
							(
								@playingHand.cards[0].rank == 'Ace' &&
								@cardValue( @playingHand.cards[1] ) == 10
							) || (
								@playingHand.cards[1].rank == 'Ace' &&
								@cardValue( @playingHand.cards[0] ) == 10
							)
						)
					)
		)

		split: new Action(
			() ->
				@playingHand.show()

				newHand = new Hand( @playingHand.cards[0],@playingHand.bet )
				@money -= @playingHand.bet
				@hands.push newHand
				@playingHand.cards.removeCard()
				@playingHand.playable = false

				for hand in @hands
					if not hand.playable
						hand.addCard @dealer.deal()
			() ->
				@playingHand.cards.length < 3 &&
				@playingHand.cards[0].rand == @playingHand.cards[1].rank
		)

		buy: new Action(
			() ->


			() ->
				@actions.twist.canDo.call(@) &&
				@money >= @playingHand.betRange( @playingHand ).min

		)

		twist: new Action(
			() ->

			() ->
				value = 0
				value += Pontoon.cardValue(card)[0] for card in @playingHand.cards
				@playingHand.cards.length < 5 && value <= 21
		)

		stand: new Action(
			() ->

			() -> true
		)