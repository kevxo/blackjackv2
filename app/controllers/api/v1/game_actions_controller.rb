class Api::V1::GameActionsController < ApplicationController
  def create
    redirect_to game_path(data: GameFacade.hit( current_user.username, params["player_hand"], params["dealer_hand"], params["deck"]) )
  end

  def stand
    redirect_to game_path(data: GameFacade.stand( current_user.username, params["player_hand"], params["dealer_hand"], params["deck"]) )
  end

  def update
    # require 'pry'; binding.pry
    card = Card.find_by(id: params[:id])
    if card.number == 11
      card.update(number: 1)
    elsif card.number == 1
      card.update(number: 11)
    end

    redirect_to game_path(data: {player_hand: params[:player_hand], dealer_hand: params[:dealer_hand], deck: params[:deck]})
  end
end