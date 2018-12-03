require_relative 'console/user_interaction'
require_relative 'language'
require_relative 'board'
require_relative 'tictactoe'
require_relative 'human'
require_relative 'computer'
# This class handles the set up of the game
class Game
  def start
    ask_to_play
    create_players
    board = Board.new(@ui, @markers)
    tictactoe = TicTacToe.new(@players, board, @ui)
    tictactoe.set_current_player(@hum, @com, @player1, @player2)
    @current_player = tictactoe.current_player
    @ui.board
    board.print_board
    @ui.first(@current_player.name)
    tictactoe.play(board)
  end

  def create_players
    @markers = Marker.new
    mode = set_mode
    human_vs_computer if @ui.computer_human(mode)
    human_vs_human if @ui.human(mode)
    compter_vs_computer if @ui.computer(mode)
  end

  def human_vs_computer
    name = set_user_name
    @player1 = Human.new(@ui, @markers, name)
    set_difficulty_level(name)
    @player2 = Computer.new(@ui, @markers, 'Computer', @difficulty)
    @players = [@player1, @player2]
    @hum = @player1.set_symbol(name)
    @com = @player2.define_symbol(@hum)
  end

  def human_vs_human
    name = set_user_name
    @player1 = Human.new(@ui, @markers, name)
    name2 = set_other_user_name
    @player2 = Human.new(@ui, @markers, name2)
    @players = [@player1, @player2]
    @hum = @player1.set_symbol(name)
    @com = @player2.define_symbol(@hum)
  end

  def compter_vs_computer
    set_difficulty_level
    @player1 = Computer.new(@ui, @markers, 'Computer1', @difficulty)
    @player2 = Computer.new(@ui, @markers, 'Computer2', @difficulty)
    @players = [@player1, @player2]
    @hum = @markers.x
    @com = @player2.define_symbol(@hum)
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

  def set_user_name
    human_name = nil
    @ui.user_name
    until human_name
      human_name = @ui.read_input
      return human_name if @ui.valid_name(human_name)

      @ui.user_name
      human_name = nil
    end
  end

  def set_mode
    mode = nil
    until mode
      @ui.game_mode
      mode = @ui.read_input
      return mode if @ui.valid_mode(mode)

      mode = nil
    end
  end

  def set_other_user_name
    other_name = nil
    @ui.set_other_user_name
    until other_name
      other_name = @ui.read_input
      return other_name if @ui.valid_name(other_name)

      @ui.set_other_user_name
      other_name = nil
    end
  end

  def set_difficulty_level(name)
    @difficulty = nil
    @ui.difficulty_level(name)
    until @difficulty
      @difficulty = @ui.read_input.to_i
      return @difficulty if @ui.valid_difficulty(@difficulty)

      @ui.difficulty_level
      @difficulty = nil
    end
  end

  def quit
    @ui.bye
    exit
  end
end
