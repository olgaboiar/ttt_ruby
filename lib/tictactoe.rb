require_relative 'console/user_interaction'
# This class handles everything related to tictactoe game rules
class TicTacToe
  attr_reader :current_player

  def initialize(players, board, ui)
    @players = players
    @board = board
    @ui = ui
  end

  def set_current_player(hum, com, human, computer)
    if hum == 'X'
      @current_player_marker = hum
      @other_player_marker = com
      @current_player = human
      @other_player = computer
    else
      @current_player_marker = com
      @other_player_marker = hum
      @current_player = computer
      @other_player = human
    end
  end

  def play(board)
    until board.game_over
      @current_player.move(board, @current_player_marker)
      board.print_board
      @current_player_marker, @other_player_marker = @other_player_marker, @current_player_marker
      @current_player, @other_player = @other_player, @current_player
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
