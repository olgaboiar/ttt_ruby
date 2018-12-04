# This class definies player behavior
class Player
  def initialize(userinteraction, markers, name)
    @ui = userinteraction
    @markers = markers
    @name = name
  end

  def move(board, symbol)
    spot = set_spot
    until board.valid(board.get_value(spot))
      @ui.space_taken
      spot = set_spot
    end
    board.insert_value(spot, symbol) if board.valid(board.get_value(spot))
  end

  def define_symbol(hum)
    return @markers.o if hum == @markers.x

    @markers.x
  end
end
