# frozen_string_literal: true

require_relative 'console/user_interaction'
# This class handles everything related to tictactoe game rules
class TicTacToe
  attr_reader :current_player, :current_marker

  def initialize(players, board, userinteraction)
    @players = players
    @board = board
    @ui = userinteraction
  end

  def set_current_player(marker1, marker2, player1, player2)
    set_current_marker(marker1, marker2)
    if marker1 == 'X'
      @current_player = player1
      @other_player = player2
    else
      @current_player = player2
      @other_player = player1
    end
  end

  def set_current_marker(marker1, marker2)
    if marker1 == 'X'
      @current_marker = marker1
      @other_marker = marker2
    else
      @current_marker = marker2
      @other_marker = marker1
    end
  end

  def play(board)
    until game_over(board)
      @current_player.move(board, @current_marker)
      board.print_board
      @current_marker, @other_marker = @other_marker, @current_marker
      @current_player, @other_player = @other_player, @current_player
    end
    @ui.game_over
    declare_winner if win(board)
    @ui.tie if tie(board)
  end

  def game_over(board)
    win(board) || tie(board)
  end

  def win(board)
    board.win
  end

  def tie(board)
    return true if board.available_spots.length.zero?
  end

  def print_board
    @board.print_board
  end

  def declare_winner
    winner = @board.last_move
    @ui.declaring_winner(winner)
  end
end
