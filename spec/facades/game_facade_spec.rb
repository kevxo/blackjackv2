require 'rails_helper'

RSpec.describe GameFacade do
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

  it "Should add a card to player hand if hit" do
    all_cards = Card.all
    player_card_1 = all_cards[1]
    player_card_2 = all_cards[2]
    player_card_3 = all_cards[3]
    player = [player_card_1.id, player_card_2.id, player_card_3.id]

    dealer_card_1 = all_cards[4]
    dealer_card_2 = all_cards[5]
    dealer_card_3 = all_cards[6]
    dealer = [dealer_card_1.id, dealer_card_2.id, dealer_card_3.id]
    
    deck = [all_cards[7].id,all_cards[8].id,all_cards[9].id]
    
    user = create(:user)

    response = GameFacade.hit(user.username, player, dealer, deck)

    expect(response[:player_hand].length).to eq(4)
    expect(response[:deck].length).to eq(2)
  end

  it "Should make user loser if user goes over 21" do
    all_cards = Card.all
    player_card_1 = all_cards[1]
    player_card_2 = all_cards[46]
    player_card_3 = all_cards[48]
    player = [player_card_1.id, player_card_2.id, player_card_3.id]

    dealer_card_1 = all_cards[4]
    dealer_card_2 = all_cards[5]
    dealer_card_3 = all_cards[6]
    dealer = [dealer_card_1.id, dealer_card_2.id, dealer_card_3.id]
    
    deck = [all_cards.last.id,all_cards[8].id,all_cards[9].id]
    
    user = create(:user)
    
    response = GameFacade.hit(user.username, player, dealer, deck)

    expect(response[:player_hand].length).to eq(4)
    expect(response[:deck].length).to eq(2)
    expect(response.has_key?(:winner)).to eq(true)
    expect(response[:winner]).to eq("Dealer is the winner")
  end

  it "Should make user win if cards is higher than dealer" do
    all_cards = Card.all
    player_card_1 = all_cards[-1]
    player_card_2 = all_cards[-5]
    player = [player_card_1.id, player_card_2.id]

    dealer_card_1 = all_cards[25]
    dealer_card_2 = all_cards[-6]
    dealer = [dealer_card_1.id, dealer_card_2.id]
    
    deck = [all_cards[-2].id,all_cards[8].id,all_cards[9].id]
    
    user = create(:user)
    
    response = GameFacade.stand(user.username, player, dealer, deck)

    expect(response.has_key?(:winner)).to eq(true)
    expect(response[:winner]).to eq("#{user.username} is the winner")
  end

  it "Should make Dealer win if cards is higher than user" do
    all_cards = Card.all
    player_card_1 = all_cards[25]
    player_card_2 = all_cards[-6]
    player = [player_card_1.id, player_card_2.id]

    dealer_card_1 = all_cards[-1]
    dealer_card_2 = all_cards[-5]
    dealer = [dealer_card_1.id, dealer_card_2.id]
    
    deck = [all_cards[-2].id,all_cards[8].id,all_cards[9].id]
    
    user = create(:user)
    
    response = GameFacade.stand(user.username, player, dealer, deck)

    expect(response.has_key?(:winner)).to eq(true)
    expect(response[:winner]).to eq("Dealer is the winner")
  end

  it "Should make Dealer and user tie" do
    all_cards = Card.all
    player_card_1 = all_cards[-1]
    player_card_2 = all_cards[-5]
    player = [player_card_1.id, player_card_2.id]

    dealer_card_1 = all_cards[-3]
    dealer_card_2 = all_cards[-6]
    dealer = [dealer_card_1.id, dealer_card_2.id]
    
    deck = [all_cards[-2].id,all_cards[8].id,all_cards[9].id]
    
    user = create(:user)
    
    response = GameFacade.stand(user.username, player, dealer, deck)

    expect(response.has_key?(:winner)).to eq(true)
    expect(response[:winner]).to eq("Tie")
  end

  it "Should make Dealer and user losses" do
    all_cards = Card.all
    player_card_1 = all_cards[-1]
    player_card_2 = all_cards[-2]
    player = [player_card_1.id, player_card_2.id]

    dealer_card_1 = all_cards[-3]
    dealer_card_2 = all_cards[-4]
    dealer = [dealer_card_1.id, dealer_card_2.id]
    
    deck = [all_cards[-7].id,all_cards[8].id,all_cards[9].id]
    
    user = create(:user)
    
    response = GameFacade.stand(user.username, player, dealer, deck)

    expect(response.has_key?(:winner)).to eq(true)
    expect(response[:winner]).to eq("Both Lose")
  end
end