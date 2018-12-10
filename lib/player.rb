# frozen_string_literal: true

# This class definies player behavior
class Player
  def initialize(userinteraction, markers)
    @ui = userinteraction
    @markers = markers
  end

  def move(board, symbol)
    spot = set_spot
    until board.valid(board.get_value(spot))
      @ui.space_taken
      spot = set_spot
    end
    board.insert_value(spot, symbol) if board.valid(board.get_value(spot))
  end

  def define_symbol(marker)
    return @markers.o if marker == @markers.x

    @markers.x
  end

  def create_player(player)
    if player == '1'
      name = set_user_name
      Human.new(@ui, @markers, name)
    else
      difficulty = set_difficulty_level
      Computer.new(@ui, @markers, 'Computer', difficulty)
    end
  end

  def set_user_name
    name = nil
    until name
      @ui.user_name
      name = @ui.read_input
      return name if @ui.valid_name(name)

      name = nil
    end
  end

  def set_difficulty_level
    difficulty = nil
    until difficulty
      @ui.difficulty_level
      difficulty = @ui.read_input.to_i
      return difficulty if @ui.valid_difficulty(difficulty)

      difficulty = nil
    end
  end
end
