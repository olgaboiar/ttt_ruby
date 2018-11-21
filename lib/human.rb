class Human 

  attr_accessor :messages, :input, :name
  
  def initialize(input, messages, name)
    @messages = messages
    @input = input
    @name = name
  end

  def set_spot(board,hum)
    spot = nil
    until spot
      spot = input.get_input
      return spot.to_i - 1 if input.valid(spot)
      messages.entering_number
      spot = nil
    end
  end

  def set_symbol
    hum = nil
    until hum
      @messages.choosing_symbol
      symbol = input.get_input
      hum = input.check_symbol(symbol)
    end
    return hum
  end

  def move(board, symbol, spot)
    board.insert_value(spot, symbol)
  end
  
end