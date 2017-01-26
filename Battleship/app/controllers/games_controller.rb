class GamesController < ApplicationController
  include SessionsHelper

  def index
    @game = Game.new
  end

  def show
  end

  def create
    @game = Game.new({player1_id:  current_user.id,
                     player2_id: current_user.id})
    p "!" * 100
    p @game

    if @game.save
      @board = Board.new({player_id:  current_user.id,
                          game_id: @game.id})

    else
      flash[:alert] = @game.errors.full_messages
      render 'new'
    end
  end

  def new

  end

  def destroy
  end
end
