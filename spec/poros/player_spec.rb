require 'rails_helper'

RSpec.describe Player do
  it 'Should exist' do
    user = create(:user)
    card1 = Card.create!(number: 8, suit: 'hearts', img: "8_of_hearts")
    card2 = Card.create!(number:4, suit: "spades", img: "4_of_spades")
    cards = [card1, card2]
    
    player = Player.new(user.username, cards)

    expect(player).to be_a(Player)
    expect(player.name).to eq(user.username)
    expect(player.cards).to eq([card1, card2])
  end

  it 'should be able to add a card to the player' do
    user = create(:user)
    card1 = Card.create!(number: 8, suit: 'hearts', img: "8_of_hearts")
    card2 = Card.create!(number:4, suit: "spades", img: "4_of_spades")
    card3 = Card.create!(number:10, suit: "queen", img: "queen_of_hearts")
    cards = [card1, card2]
    
    player = Player.new(user.username, cards)

    expect(player.cards.count).to eq(2)

    player.add_card(card3)
    expect(player.cards.count).to eq(3)
    expect(player.cards.last).to eq(card3)
  end

  it "should be able to calculate the players card score" do 
    user = create(:user)
    card1 = Card.create!(number: 8, suit: 'hearts', img: "8_of_hearts")
    card2 = Card.create!(number:4, suit: "spades", img: "4_of_spades")
    card3 = Card.create!(number:10, suit: "queen", img: "queen_of_hearts")
    cards = [card1, card2]
    
    player = Player.new(user.username, cards)

    expect(player.card_score).to eq(12)

    player.add_card(card3)
    player.calculate_card_score
    expect(player.card_score).to eq(22)
  end
end