require 'spec_helper'
require_relative '../lib/game'

describe Game do
  before do
    @input = UserInteraction.new
    # language = Language.new(@input)
    markers = Marker.new
    allow_any_instance_of(Language).to receive(:set_lang).and_return('1')
    player1 = Human.new(@input, markers, 'V')
    player2 = Human.new(@input, markers, 'J')
    allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
    @board = Board.new(@input, markers)
    # tictactoe = TicTacToe.new(player1, player2, @board)
    @game = Game.new
  end

  # describe ' #start' do
  #   it 'shoul ask the user to play' do
  #   end
  # end

  # describe ' #set_mode' do
  #   it 'shoul ask the user to play' do
  #     allow_any_instance_of(UserInteraction).to receive(:read_input).and_return('1')
  #     actual = @game.set_mode
  #     expect(actual).to eq('1')
  #   end
  # end
end
