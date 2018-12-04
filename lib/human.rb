require_relative 'player'
# This class defines Human player behavior and inherites from Player class
class Human < Player
  attr_accessor :input, :markers, :name

  # def initialize(userinteraction, markers, name)
  #   @ui = userinteraction
  #   @markers = markers
  #   @name = name
  # end

  def set_spot
    spot = nil
    until spot
      @ui.entering_number
      spot = @ui.read_input
      return spot.to_i - 1 if @ui.valid(spot)

      spot = nil
    end
  end

  def choose_symbol(name)
    hum = nil
    until hum
      @ui.choosing_symbol(name)
      symbol = @ui.read_input
      hum = @ui.check_symbol(symbol)
    end
    hum
  end

  # def define_symbol(hum)
  #   return @markers.o if hum == @markers.x

  #   @markers.x
  # end

  # def move(board, symbol)
  #   spot = set_spot
  #   until board.valid(board.get_value(spot))
  #     @ui.space_taken
  #     spot = set_spot
  #   end
  #   board.insert_value(spot, symbol) if board.valid(board.get_value(spot))
  #   # @ui.great_move
  # end
end
