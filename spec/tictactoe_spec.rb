require 'spec_helper'
require_relative '../lib/tictactoe'

describe TicTacToe do
  before do
    markers = Marker.new
    human = Human.new(@input, markers, 'Vasya')
    computer = Human.new(@input, markers, 'Ivan')
    allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
    @input = UserInteraction.new
    @board = Board.new(@input, markers)
    board_size = BoardSize.new(@input)
    @setup = Setup.new(board_size.set_size)
    players = [human, computer]
    @tictactoe = TicTacToe.new(players, @board, @input)
  end

  describe '#print_board' do
    it 'should print tictactoe board' do
      expect do
        @tictactoe.print_board
      end.to output(" \n  1 |  2 |  3 |\n----+----+----+\n  4 |  5 |  6 |\n----+----+----+\n  7 |  8 |  9 |\n----+----+----+\n").to_stdout
    end
  end

  describe '#game_over' do
    it 'should return true when tie is reached' do
      @board.insert_value(2, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(7, 'O')
      @board.insert_value(1, 'X')
      @board.insert_value(3, 'O')
      @board.insert_value(5, 'X')
      @board.insert_value(6, 'O')
      @board.insert_value(8, 'X')
      actual = @tictactoe.game_over(@board)
      expect(actual).to be(true)
    end
    it 'should return true when win is reached' do
      @board.insert_value(1, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(6, 'O')
      @board.insert_value(7, 'X')
      actual = @tictactoe.game_over(@board)
      expect(actual).to be(true)
    end
    it 'should return false when neither win nor tie is reached' do
      actual = @tictactoe.game_over(@board)
      expect(actual).to be_falsey
    end
    it 'should return false when neither win nor tie is reached' do
      @board.insert_value(2, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      actual = @tictactoe.game_over(@board)
      expect(actual).to be_falsey
    end
  end

  describe '#tie' do
    it 'should return true wneh all cells are X or O' do
      @board.insert_value(2, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(7, 'O')
      @board.insert_value(1, 'X')
      @board.insert_value(3, 'O')
      @board.insert_value(5, 'X')
      @board.insert_value(6, 'O')
      @board.insert_value(8, 'X')
      actual = @tictactoe.tie(@board)
      expect(actual).to be(true)
    end
    it 'should return false wneh not all cells are X or O' do
      @board.insert_value(2, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(7, 'O')
      @board.insert_value(6, 'X')
      actual = @tictactoe.tie(@board)
      expect(actual).to be_falsey
    end
  end
end
