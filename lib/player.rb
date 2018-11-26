class Player

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def move(board, symbol, spot)
    board.insert_value(spot, symbol)
  end

end