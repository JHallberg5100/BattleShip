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

  def shots
    @board = Board.find_by(id: params[:board_id])
    @board.shots << shot
    ship_array = @board.ships
    shot = params[:shot]
    ship_array.each do |ship|
      shot_array = ship.shots.split(' ')
      shot_array.each do |ship_shot|
        if ship_shot == shot
          return true
        end
      end
    end
    return false
  end
  def destroy
  end
end
