require 'spec_helper'
require_relative '../lib/computer'

describe Computer do
  before do
    @markers = Marker.new
    @ui = UserInteraction.new
    difficulty = 2
    @computer = Computer.new(@ui, @markers, 'Computer', difficulty)
  end

  describe '#define_opponent(symbol)' do
    it 'should return O' do
      @computer.define_opponent('X')
      actual = @computer.opponent
      expect(actual).to eq('O')
    end
  end

  describe '#next_player(last_move)' do
    it 'should return O' do
      marker = @computer.define_opponent('X')
      actual = @computer.next_player(marker)
      expect(actual).to eq('O')
    end
    it 'should return O' do
      marker = @computer.define_opponent('O')
      actual = @computer.next_player(marker)
      expect(actual).to eq('X')
    end
  end

  describe ' #move(board, symbol)' do
    it 'should call sleep for 2 seconds' do
      allow(Computer).to receive(:sleep)
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
      allow_any_instance_of(UserInteraction).to receive(:computer_move)
      @board = Board.new(@input, @markers)
      board_size = BoardSize.new(@input)
      @setup = Setup.new(board_size.set_size)
      @computer.move(@board, 'O')
      expect(@board.get_value(8)).to eq('O')
    end
  end
end
