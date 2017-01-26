class ShipsController < ApplicationController
  include ShipsHelper

  def index
    @player1_board = Board.find_by(player_id: current_user)
  end

  def create
    position = find_position(params[:position], params[:size], params[:direction])
    p position
    position = position.join(' ')
    ship_hash = {type_name: params[:name], position: position, size: params[:size], board_id: params[:board_id]}
    @ship = Ship.new(ship_hash)
    @ship.save
    return "Please"
  end

end
