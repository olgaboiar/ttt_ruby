# This class handles the size of the board. Move functionality to board class???
class BoardSize
  def initialize(userinteraction)
    @ui = userinteraction
  end

  def set_size
    size = nil
    until size
      @ui.choosing_size
      argument = @ui.read_input
      size = @ui.check_size(argument)
    end
    size
  end
end
