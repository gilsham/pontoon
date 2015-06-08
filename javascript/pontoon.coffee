class Pontoon extends Game
	constructor: (@dealer, players, @minBet = 1, @maxBet) ->
		super(players)

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
			(hand) ->
				for card in hand.cards
					if card.rank == 'Ace'
						card.show()
			(hand) ->
				return (
						hand.length < 3 &&
						(
							(hand.cards[0].rank == 'Ace' && @cardValue(hand.cards[1]) == 10) ||
							(hand.cards[1].rank == 'Ace' && @cardValue(hand.cards[0]) == 10)
						)
					)
		)

		split: new Action(
			() ->
				for card in @cards
					card.show()

				newHand = new Hand(@cards[0],@bet)
				@money -= @bet
				@hands.push newHand
				hand.cards.removeCard()
				hand.playable = false

				for hand in @hands
					if not hand.playable
						hand.addCard @dealer.deal()
			() ->
				return (
					@cards.length < 3 &&
					@cards[0].rand == @cards[1].rank
				)
		)

		buy: new Action(
			() ->

			() ->
				value = 0
				value += Pontoon.cardValue(card)[0] for card in @cards
				return @cards.length < 5 && value < 21 && @

		)