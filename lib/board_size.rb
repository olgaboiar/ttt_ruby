class BoardSize
  
  def initialize(input, messages)
    @messages = messages
    @input = input
  end

  def set_size
    size = nil
    until size
      @messages.choosing_size
      argument = @input.get_input
      size = @input.check_size(argument)
    end
    return size
  end
end