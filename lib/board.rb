# frozen_string_literal: true

require_relative 'console/marker'
require_relative 'console/setup'
require_relative 'board_size'
# This class hadles the playing board. !move win into tictactoe
class Board
  def initialize(userinteraction, markers)
    @ui = userinteraction
    @markers = markers
    board_size = BoardSize.new(@ui)
    @setup = Setup.new(board_size.set_size)
    @board = @setup.create_board_array
  end

  attr_reader :board, :last_move, :markers

  def print_board
    @setup.print_board
  end

  def game_over
    win || tie
  end

  def tie
    return true if available_spots.length.zero?
  end

  def win
    @setup.win
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
