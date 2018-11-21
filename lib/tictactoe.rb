require_relative "console/user_messages"
require_relative "console/user_input"

class TicTacToe

  def initialize(player1, player2, board, messages, input)
    @player1 = player1
    @player2 = player2
    @board = board
    @messages = messages
    @input = input
  end

  attr_accessor :messages

  def play(board, hum, com)
    until board.game_over
      messages.entering_number
      spot = @player1.set_spot(board, hum)
      messages.space_taken if !board.valid(board.get_value(spot))
      if board.valid(board.get_value(spot))
        @player1.move(board,hum,spot)
        messages.great_move
        @player2.move(board,com) if !board.game_over
        board.print_board
        messages.computer_move
      end
    end
    messages.game_over
    self.declare_winner if board.win
    messages.tie if board.tie
  end

  def print_board
    @board.print_board
  end

  def declare_winner
    winner = @board.last_move
    messages.declaring_winner(winner)
  end
end