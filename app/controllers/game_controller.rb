class GameController < ApplicationController
    def index
        initial_cards = Card.get_shuffled_deck

        @player = Player.new(current_user.username, [initial_cards[-1], initial_cards[-3]])
        @dealer = Player.new('Dealer', [initial_cards[-2], initial_cards[-4]])

        initial_cards.pop(4)

    end
end