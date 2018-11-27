require_relative 'console/marker'
require_relative 'console/setup'
require_relative 'board_size'

class Board
  def initialize(ui, markers)
    @ui = ui
    @markers = markers
    board_size = BoardSize.new(@ui)
    @setup = Setup.new(board_size.set_size)
    @board = @setup.create_board_array
  end

  attr_reader :board, :last_move, :markers

  def print_board
    @setup.print_board
  end

  def win
    @setup.win
  end

  def tie
    return true if available_spots.length.zero?
  end

  def game_over
    win || tie
  end

  def get_value(spot)
    @board[spot]
  end

  def insert_value(spot, marker)
    @board[spot] = marker
    @last_move = marker
  end

  def valid(spot)
    spot != @markers.x && spot != @markers.o
  end

  def available_spots
    available_spots = []
    @board.each do |spot|
      available_spots << spot if valid(spot)
    end
    available_spots
  end
end
