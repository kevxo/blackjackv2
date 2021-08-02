class GameController < ApplicationController
    def index
        @game = Game.new(current_user.username)
    end
end