require_relative "../lib/game"

describe Game do
    
  before do
    @input = UserInput.new
    language = Language.new(@input)
    allow_any_instance_of(Language).to receive(:set_lang).and_return("1")
    @messages = UserMessages.new(language.set_lang)
    player1 = Human.new(@input, @messages, "V")
    player2 = Human.new(@input, @messages, "J")
    allow_any_instance_of(BoardSize).to receive(:set_size).and_return("3")
    @board = Board.new(@input, @messages)
    tictactoe = TicTacToe.new(player1, player2, @board, @messages)
    @game = Game.new(tictactoe)
  end

end