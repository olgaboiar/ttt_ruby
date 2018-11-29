require 'spec_helper'
require_relative '../lib/game'

describe Game do
  before do
    @input = UserInteraction.new
    language = Language.new(@input)
    allow_any_instance_of(Language).to receive(:set_lang).and_return('1')
    @messages = UserMessages.new(language.set_lang)
    player1 = Human.new(@input, 'V')
    player2 = Human.new(@input, 'J')
    allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
    @board = Board.new(@input)
    tictactoe = TicTacToe.new(player1, player2, @board)
    @game = Game.new(tictactoe)
  end
end
