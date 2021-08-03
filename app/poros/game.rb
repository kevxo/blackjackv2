class Game
    attr_accessor :player, :dealer, :deck
    def initialize(username, data = nil)
        if data == nil
            @deck = Card.get_shuffled_deck
            @player = Player.new(username, [@deck[-1], @deck[-3]])
            @dealer = Player.new('Dealer', [@deck[-2], @deck[-4]])
            
            # Removed the last 4 cards
            @deck.pop(4)
        else
            @deck = data[:deck]
            @player = Player.new(username, Card.find(data[:player_hand]))
            @dealer = Player.new('Dealer', Card.find(data[:dealer_hand]))
        end
    end
end