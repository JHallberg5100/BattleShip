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

    if @game.save
      @board = Board.new({player_id:  current_user.id,
                          game_id: @game.id})
      @board.save

    else
      flash[:alert] = @game.errors.full_messages
      render 'new'
    end
  end

  def shots
    @board = Board.find_by(id: params[:board_id].to_i)
    if shots_helper(params)
      render :json => { :file_content => "true"}
    else
      render :json => { :file_content => "false"}
    end
  end

  def update_game
    @game = Game.find_by(params[:game_id])
    @board = Board.find_by(params[:board_id])
    @opponent_board = @game.boards.reject {|board| board.id == @board.id}
    response = {}
    response[:shots] = parse_hits(@opponent_board)
    if response[:shots].count("hit") >= 17
      response[:win_state] = "You win!"
    end
    response[:ships] = @board.ships.each {|ship| ship.location + " "}
    response[:opponent_shots] = parse_hits(@board)
    if response[:opponent_shots].count("hit") >= 17
      response[:win_state] = "You lost! Aaargh."
     end
    render :json => response
  end

  def destroy
  end
end
