require_relative "console/user_interaction"
require_relative "language"
require_relative "board"
require_relative "tictactoe"
require_relative "human"
require_relative "computer"

class Game

  def start
    @ui = UserInteraction.new
    language = Language.new(@ui)
    lang = language.set_lang
    @ui.set_translation(lang)
    @ui.greeting
    response = @ui.get_input
    @ui.bye if !@ui.positive(response)
    if @ui.positive(response)
      markers = Marker.new
      set_user_name
      @human = Human.new(@ui, @human_name)
      set_difficulty_level
      @computer = Computer.new(@ui, markers, "Computer", @difficulty)
      board = Board.new(@ui, markers)
      players = [@human, @computer]
      tictactoe = TicTacToe.new(players, board, @ui)
      @hum = @human.set_symbol
      @com = @computer.set_symbol(@hum)
      tictactoe.set_current_player(@hum, @com, @human, @computer)
      @current_player = tictactoe.current_player
      @ui.board
      board.print_board
      @ui.first(@current_player.name)
      tictactoe.play(board)
    end
  end

  def set_user_name
    @ui.user_name
    @human_name = @ui.get_input
    return @human_name
  end

  def set_difficulty_level
    @ui.difficulty_level
    @difficulty = @ui.get_input.to_i
    return @difficulty
  end
end
