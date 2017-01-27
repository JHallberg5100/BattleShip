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
    # respond_to do |format|
    #   format.html
    #   format.js { data }
    end
  end


  def destroy
  end
end
