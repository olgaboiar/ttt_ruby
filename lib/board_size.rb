class BoardSize
  
  def initialize(ui)
    @ui = ui
  end

  def set_size
    size = nil
    until size
      @ui.choosing_size
      argument = @ui.get_input
      size = @ui.check_size(argument)
    end
    return size
  end
end
