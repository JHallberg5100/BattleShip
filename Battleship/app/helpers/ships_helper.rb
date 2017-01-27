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
    p "~~~~~~~~~~~~~~~~~~~~~~~"
    p "I did a thing"
    position_letter = position.split('')[0]
    position_num = position.split('')[1]
    matched_letter_index = ALPHABET.index(position_letter)
    letters_array = Array.new
    new_array = ALPHABET.slice(0..matched_letter_index)
    new_array.reverse!.each do |char|
      if (letters_array.length.to_i) == size.to_i
        break
      else
        letters_array << char + position_num
      end
    end
    letters_array
  end

  def find_position_vertical(position, size)
    size = size.to_i
    position_letter= position.split('')[0]
    position_num = position.split("")[1].to_i
    output_array = []
    output_array << position
    temp_string = ""
    runner = true
    size -= 1
    while runner
      if size == 0
        runner = false
      else
        position_num -= 1
        temp_string = position_letter + position_num.to_s
        output_array << temp_string
        size -= 1
      end
    end
    output_array
  end
end
