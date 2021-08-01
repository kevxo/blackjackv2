class Card < ApplicationRecord
    validates :number, :suit, :img, presence: true 
end
