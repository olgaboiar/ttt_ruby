class Human 

  attr_accessor :input, :name
  
  def initialize(ui, name)
    @ui = ui
    @name = name
  end

  def set_spot(board,hum)
    spot = nil
    until spot
      spot = @ui.get_input
      return spot.to_i - 1 if @ui.valid(spot)
      @ui.entering_number
      spot = nil
    end
  end

  def set_symbol
    hum = nil
    until hum
      @ui.choosing_symbol
      symbol = @ui.get_input
      hum = @ui.check_symbol(symbol)
    end
    return hum
  end

  def move(board, symbol, spot)
    board.insert_value(spot, symbol)
  end
  
end