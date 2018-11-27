require_relative 'console/user_interaction'
# This class handles everything related to tictactoe game rules
class TicTacToe
  attr_reader :current_player

  def initialize(players, board, userinteraction)
    @players = players
    @board = board
    @ui = userinteraction
  end

  def set_current_player(hum, com, human, computer)
    set_current_marker(hum, com)
    if hum == 'X'
      @current_player = human
      @other_player = computer
    else
      @current_player = computer
      @other_player = human
    end
  end

  def set_current_marker(hum, com)
    if hum == 'X'
      @current_marker = hum
      @other_marker = com
    else
      @current_marker = com
      @other_marker = hum
    end
  end

  def play(board)
    until board.game_over
      @current_player.move(board, @current_marker)
      board.print_board
      @current_marker, @other_marker = @other_marker, @current_marker
      @current_player, @other_player = @other_player, @current_player
    end
    @ui.game_over
    declare_winner if board.win
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
