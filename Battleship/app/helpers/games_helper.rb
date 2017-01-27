module GamesHelper

  def grid_converter(position)
    coords = {

    }
  end
end

  def shots_helper(params)
    @board = Board.find_by(id: params[:board_id].to_i)
    p "~~~~~~~"
    p params
    p params[:shot]
    p @board.shots
    p params[:board_id]
    @board.shots += " " + params[:shot]
    @board.save
    ship_array = @board.ships
    shot = params[:shot]
    ship_array.each do |ship|
      shot_array = @board.shots.split(' ')
      shot_array.each do |ship_shot|
        if ship_shot == shot
           true
        end
      end
    end
     false
  end


  def parse_hits(board)
    ship_array = board.ships
    shot_array = board.shots.split(" ")
    output_string = ""
    ship_array.each do |ship|
      ship_location = ship.position.split(" ")
      ship_location.each do |square|
        shot_array.each do |shot|
          output_string += shot + " "
          if shot == square
            output_string += "hit" + " "
          else
            output_string += "miss" + " "
          end
        end
      end
      output_string
    end
  end
