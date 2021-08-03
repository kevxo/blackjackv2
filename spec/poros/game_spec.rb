require 'rails_helper'

RSpec.describe Game do
    setup do
        (2..9).each do |index|
            suites = ["clubs", "diamonds", "hearts", "spades"]
        
            suites.each do |suit|
                Card.create!(number: index, suit: suit, img: "#{index}_of_#{suit}")
            end
        end
        
        faces = ["10","jack", "king", "queen"]
        suites = ["clubs", "diamonds", "hearts", "spades"]
        faces.each do |face|
            suites.each do |suit|
                Card.create!(number: 10, suit: suit, img: "#{face}_of_#{suit}")
            end
        end
        
        4.times do |index|
            suites = ["clubs", "diamonds", "hearts", "spades"]
        
            Card.create!(number: 11, suit: "ace", img: "ace_of_#{suites[index]}")
        end
    end
    
    it 'Should exist with defaults' do
        user = create(:user)
        
        game = Game.new(user.username)

        expect(game).to be_a(Game)
        expect(game.player.name).to eq(user.username)
        expect(game.deck).to be_a(Array)
        expect(game.deck.first).to be_a(Card)
        expect(game.deck.last).to be_a(Card)
    end

    it 'Should be created with data if passed into it' do
        deck = Card.get_shuffled_deck
        player_card_1 = deck[-1]
        player_card_2 = deck[-2]
        player_card_3 = deck[-3]
        player = [player_card_1.id, player_card_2.id, player_card_3.id]

        dealer_card_1 = deck[-4]
        dealer_card_2 = deck[-5]
        dealer_card_3 = deck[-6]
        dealer = [dealer_card_1.id, dealer_card_2.id, dealer_card_3.id]
        
        deck.pop(6)
        
        user = create(:user)
        data = {player_hand: player, dealer_hand: dealer, deck: deck}
        
        
        game = Game.new(user.username, data)

        expect(game).to be_a(Game)
        expect(game.player.name).to eq(user.username)
        expect(game.deck).to be_a(Array)
        expect(game.deck.length).to eq(46)
        expect(game.deck.first).to be_a(Card)
        expect(game.deck.last).to be_a(Card)
        expect(game.player).to be_a(Player)
        expect(game.player.cards.count).to eq(3)
        expect(game.dealer).to be_a(Player)
        expect(game.dealer.cards.count).to eq(3)
    end
end