module ShipsHelper

  ALPHABET = ['A','B','C','D','E','F','G','H','I','J']

  def find_position(position, size, direction)
    if direction == "horizontal"
      find_position_horizontal(position,size)
    else
      find_position_vertical(position, size)
    end
  end

  def find_position_horizontal(position, size)
    position_letter = position.split('')[0]
    position_num = position.split('')[1]
    matched_letter_index = ALPHABET.index(position_letter)
    letters_array = Array.new
    new_array = ALPHABET.slice(0..matched_letter_index)
    new_array.reverse!.each do |char|
      if letters_array.length == size
        break
      else
        letters_array << char + position_num
      end
    end
    letters_array
  end

  def find_position_vertical(position, size)
    position_letter= position.split('')[0]
    position_num = position.split("")[1]
    output_array = []
    output_array << position



  end

end
