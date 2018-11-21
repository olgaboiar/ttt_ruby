require_relative "console/user_interaction"

class TicTacToe

  def initialize(player1, player2, board, ui)
    @player1 = player1
    @player2 = player2
    @board = board
    @ui = ui
  end

  def play(board, hum, com)
    until board.game_over
      @ui.entering_number
      spot = @player1.set_spot(board, hum)
      @ui.space_taken if !board.valid(board.get_value(spot))
      if board.valid(board.get_value(spot))
        @player1.move(board,hum,spot)
        @ui.great_move
        @player2.move(board,com) if !board.game_over
        board.print_board
        @ui.computer_move
      end
    end
    @ui.game_over
    self.declare_winner if board.win
    @ui.tie if board.tie
  end

  def print_board
    @board.print_board
  end

  def declare_winner
    winner = @board.last_move
    @ui.declaring_winner(winner)
  end
end