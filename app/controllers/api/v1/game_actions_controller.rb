class Api::V1::GameActionsController < ApplicationController
  def create
    redirect_to game_path(data: GameFacade.hit( current_user.username, params["player_hand"], params["dealer_hand"], params["deck"]) )
  end

  def stand
    redirect_to game_path(data: GameFacade.stand( current_user.username, params["player_hand"], params["dealer_hand"], params["deck"]) )
  end
end