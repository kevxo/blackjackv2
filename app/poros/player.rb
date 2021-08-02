class Player
    attr_accessor :name, :cards, :card_score

    def initialize(player_name, player_cards)
        @name = player_name
        @cards = player_cards
        @card_score = 0
    end

    def add_card(card)
        @cards << card
    end

    def calculate_card_score
        @card_score = 0

        @cards.each do |card|
            @card_score += card.number
        end
    end
end