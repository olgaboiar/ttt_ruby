require_relative 'player'
# This class defines Human player behavior and inherites from Player class
class Human < Player
  attr_accessor :input, :markers, :name

  def initialize(userinteraction, markers, name)
    super(userinteraction, markers, name)
  end

  def set_spot
    spot = nil
    until spot
      @ui.entering_number
      spot = @ui.read_input
      return spot.to_i - 1 if @ui.valid(spot)

      spot = nil
    end
  end

  def choose_symbol
    hum = nil
    until hum
      @ui.choosing_symbol
      symbol = @ui.read_input
      hum = @ui.check_symbol(symbol)
    end
    hum
  end
end
