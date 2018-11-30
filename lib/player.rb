# Parent class for Human and Computer
class Player
  attr_accessor :input, :name

  def initialize(userinteraction, name)
    @ui = userinteraction
    @name = name
  end

  def move(board, symbol)
    board.insert_value(spot, symbol)
  end
end
