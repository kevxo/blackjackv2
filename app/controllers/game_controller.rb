class GameController < ApplicationController
    def index
        if params[:data]
            @game = Game.new(current_user.username, params[:data])
        else
            @game = Game.new(current_user.username)
        end
    end
end