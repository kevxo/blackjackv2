class GameFacade
    class << self
        def hit(username, player_hand, dealer_hand, deck)
            game = {player_hand: player_hand, dealer_hand: dealer_hand, deck: deck}
            game[:deck] = Card.get_shuffled_deck if deck.empty?
            game[:player_hand] << game[:deck].pop(1)

            player = Player.new(username, Card.find(player_hand))

            if player.card_score >= 22
                game[:winner] = "Dealer is the winner"
                player = User.find_by(username: username)
                player.update(losses: (player.losses + 1))
            end

            return game
        end

        def stand(username, player_hand, dealer_hand, deck)
            player = Player.new(username, Card.find(player_hand))
            dealer = Player.new('Dealer', Card.find(dealer_hand))
            game = {player_hand: player_hand, dealer_hand: dealer_hand, deck: deck}

            while dealer.card_score <= 16
                game[:deck] = Card.get_shuffled_deck if deck.empty?
                dealer.cards << Card.find_by(id: deck[-1])
                dealer.calculate_card_score
                
                game[:dealer_hand] << game[:deck].pop(1)
            end

            if player.card_score > dealer.card_score || dealer.card_score >= 22 && player.card_score <= 21
                game[:winner] = username + ' is the winner'
                player = User.find_by(username: username)
                player.update(wins: (player.wins + 1))
            elsif player.card_score < dealer.card_score || player.card_score >= 22 && dealer.card_score <= 21
                game[:winner] = "Dealer is the winner"
                player = User.find_by(username: username)
                player.update(losses: (player.losses + 1))
            elsif player.card_score == dealer.card_score && player.card_score <= 21
                game[:winner] = "Tie"
            else
                game[:winner] = "Both Lose"
                player = User.find_by(username: username)
                player.update(losses: (player.losses + 1))
            end
            
            return game
        end
    end
end