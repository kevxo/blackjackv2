class GameFacade
    class << self
        def hit(username, player_hand, dealer_hand, deck)
            game = {player_hand: player_hand, dealer_hand: dealer_hand, deck: deck}
            game[:player_hand] << game[:deck].pop(1)

            return game
        end
    end
end