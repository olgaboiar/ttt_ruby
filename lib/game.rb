require_relative "console/user_messages"
require_relative "console/user_input"
require_relative "language"
require_relative "board"
require_relative "tictactoe"
require_relative "human"
require_relative "computer"

class Game

  def start
    input = UserInput.new
    language = Language.new(input)
    lang = language.set_lang
    messages = UserMessages.new(lang)
    messages.greeting
    response = input.get_input
    messages.bye if !input.positive(response)
    if input.positive(response)
      markers = Marker.new
      player1 = Human.new(input, messages, "Vasya")
      player2 = Computer.new(markers)
      board = Board.new(input, messages, markers)
      tictactoe = TicTacToe.new(player1, player2, board, messages, input)
      @hum = player1.set_symbol
      @com = player2.set_symbol(@hum)
      board.print_board
      tictactoe.play(board, @hum, @com)
    end
  end
end
