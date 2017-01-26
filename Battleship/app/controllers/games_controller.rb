class GamesController < ApplicationController
  include SessionsHelper

  def index
    @game = Game.new
  end

  def show
    @game = Game.find_by(id: params[:id])
    @board = @game.boards.find_by(player_id: current_user.id)
  end

  def create

  end

  def new
    @game = Game.new({player1_id:  current_user.id,
                     player2_id: current_user.id})
    p "!" * 100
    p @game

    if @game.save
      @board = Board.new({player_id:  current_user.id,
                          game_id: @game.id})
      @board.save
      p @board

    else
      flash[:alert] = @game.errors.full_messages
      render 'new'
    end
  end

  def destroy
  end
end
