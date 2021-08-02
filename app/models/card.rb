class Card < ApplicationRecord
    validates :number, :suit, :img, presence: true 


    def self.get_shuffled_deck
        Card.all.shuffle
    end
end
