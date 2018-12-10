# frozen_string_literal: true

require_relative 'console/user_interaction'
require_relative 'language'
require_relative 'board'
require_relative 'tictactoe'
require_relative 'human'
require_relative 'computer'
require_relative 'player'
# This class handles the set up of the game
class Game
  def start
    ask_to_play
    create_players
    board = Board.new(@ui, @markers)
    tictactoe = TicTacToe.new(@players, board, @ui)
    tictactoe.set_current_player(@marker1, @marker2, @player1, @player2)
    @current_player = tictactoe.current_player
    @ui.board
    board.print_board
    @ui.first(@current_player.name)
    tictactoe.play(board)
  end

  def create_players
    @markers = Marker.new
    @player1 = define_player(1)
    @player2 = define_player(2)
    @players = [@player1, @player2]
    @marker1 = @player1.choose_symbol
    @marker2 = @player2.define_symbol(@marker1)
  end

  def define_player(num)
    player = nil
    until player
      @ui.define_player(num)
      player = @ui.read_input
      break if @ui.valid_player(player)

      player = nil
    end
    helper = Player.new(@ui, @markers)
    helper.create_player(player)
  end

  def ask_to_play
    @ui = UserInteraction.new
    set_language
    @ui.greeting
    response = @ui.read_input
    quit unless @ui.positive(response)
  end

  def set_language
    language = Language.new(@ui)
    lang = language.set_lang
    @ui.choose_translation(lang)
  end

  def quit
    @ui.bye
    exit
  end
end
