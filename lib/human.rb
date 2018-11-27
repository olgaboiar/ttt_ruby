class Human 
  attr_accessor :input, :name
  
  def initialize(ui, name)
    @ui = ui
    @name = name
  end

  def name
    @name
  end

  def set_spot(board)
    spot = nil
    until spot
      @ui.entering_number
      spot = @ui.get_input
      return spot.to_i - 1 if @ui.valid(spot)
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

  def move(board, symbol)
    spot = self.set_spot(board)
    until board.valid(board.get_value(spot))
      @ui.space_taken
      spot = self.set_spot(board,symbol)
    end
    if board.valid(board.get_value(spot))
      board.insert_value(spot, symbol)
      # @ui.great_move      
    end
  end
end
