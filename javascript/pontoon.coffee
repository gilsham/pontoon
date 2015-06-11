class Pontoon extends Game
	constructor: (dealer, playerDetails, @minBet = 1, @maxBet = 100) ->
		include Player,
			actions: Pontoon.actions

		reinit = (player) => if player.name == dealer then @dealer = new Dealer(player.name,player.money,new Deck 3) else new Player(player.name,player.money)
		players = (reinit player for player in playerDetails)

		super(players)

	start: () ->
		
		@startRound()
		

	activePlayers: () ->
		return (player for player in @players when player.active).length

	startRound: () ->
		if @dealer.deck.length < @activePlayers() * 5
			@dealer.deck.reshuffle()

		for [0...2]
			for player in @players 
				if not player.playingHand
					player.hands.push(player.playingHand = new Hand())

				player.playingHand.addCard @dealer.deal()

		for player in @players when player != @dealer
			
				for name, action of player.actions when action.canDo.call(player)
					button = $('button').onclick = action.do.call(player).text(name).appendTo(window)

		return

	@cardValue: (card) ->
		switch card.rank
			when 'Ace' then return [1,11]

			when '2','3','4','5','6','7','8','9','10'
				return [parseInt(card.rank,10)]

			when 'Jack','Queen','King'
				return [10]

			else return NaN

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
							(@playingHand.cards[0].rank == 'Ace' && @cardValue(@playingHand.cards[1]) == 10) ||
							(@playingHand.cards[1].rank == 'Ace' && @cardValue(@playingHand.cards[0]) == 10)
						)
					)
		)

		split: new Action(
			() ->
				@playingHand.show()

				newHand = new Hand(@playingHand.cards[0],@playingHand.bet)
				@money -= @playingHand.bet
				@hands.push newHand
				@playingHand.cards.removeCard()
				@playingHand.playable = false

				for hand in @hands
					if not hand.playable
						hand.addCard @dealer.deal()
			() ->
				return
					@playingHand.cards.length < 3 &&
					@playingHand.cards[0].rand == @playingHand.cards[1].rank
		)

		buy: new Action(
			() ->


			() ->
				value = 0
				value += Pontoon.cardValue(card)[0] for card in @playingHand.cards
				return @playingHand.cards.length < 5 && value < 21 && @money > @playingHand.betRange.min

		)