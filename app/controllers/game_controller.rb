class GameController < ApplicationController
    def index
        if params[:data] && params[:data][:winner]
            @game = Game.new(current_user.username, params[:data], params[:data][:winner])
        elsif params[:data]
            @game = Game.new(current_user.username, params[:data])
        elsif params[:play_again]
            @game = Game.new(current_user.username, params[:deck])
        else
            @game = Game.new(current_user.username)
        end
    end
end