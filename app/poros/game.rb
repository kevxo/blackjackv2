class Game
    attr_accessor :player, :dealer, :deck
    def initialize(username)
        @deck = Card.get_shuffled_deck
        @player = Player.new(username, [@deck[-1], @deck[-3]])
        @dealer = Player.new('dealer', [@deck[-2], @deck[-4]])
        
        # Removed the last 4 cards
        @deck.pop(4)
    end
end