class Player

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def move(board, symbol)
    board.insert_value(spot, symbol)
  end

end