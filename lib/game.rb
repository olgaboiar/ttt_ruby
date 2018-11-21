require_relative "console/user_interaction"
require_relative "language"
require_relative "board"
require_relative "tictactoe"
require_relative "human"
require_relative "computer"

class Game

  def start
    ui = UserInteraction.new
    language = Language.new(ui)
    lang = language.set_lang
    ui.set_translation(lang)
    ui.greeting
    response = ui.get_input
    ui.bye if !ui.positive(response)
    if ui.positive(response)
      markers = Marker.new
      player1 = Human.new(ui, "Vasya")
      player2 = Computer.new(markers)
      board = Board.new(ui, markers)
      tictactoe = TicTacToe.new(player1, player2, board, ui)
      @hum = player1.set_symbol
      @com = player2.set_symbol(@hum)
      board.print_board
      tictactoe.play(board, @hum, @com)
    end
  end
end
