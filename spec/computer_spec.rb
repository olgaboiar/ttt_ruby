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

  describe '#choose_symbol' do
    it 'should return X' do
      actual = @computer.choose_symbol
      expect(actual).to eq('X')
    end
  end

  describe '#move(board, symbol)' do
    it '' do
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
      board = Board.new(@ui, @markers)
      board.insert_value(0, 'X')
      symbol = 'O'
      allow_any_instance_of(UserInteraction).to receive(:computer_move)
      @computer.move(board, symbol)
      actual = board.get_value(4)
      expect(actual).to eq('O')
    end
  end

  describe ' #set_best_move(board, last_move, depth = 0, scores = [], moves = [])' do
    it 'should return -9' do
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
      board = Board.new(@ui, @markers)
      board.insert_value(0, 'X')
      board.insert_value(4, 'O')
      board.insert_value(1, 'X')
      @computer.define_opponent('O')
      last_move = 'O'
      actual = @computer.set_best_move(board, last_move)
      expect(actual).to eq(-9)
    end
  end

  describe ' #potential_move(moves, potential_board, spot)' do
    it 'should return 9' do
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
      potential_board = Board.new(@ui, @markers)
      potential_board.insert_value(0, 'X')
      potential_board.insert_value(5, 'O')
      potential_board.insert_value(2, 'X')
      spot = 9
      moves = [3, 4, 6, 7, 8]
      @computer.potential_move(moves, potential_board, spot)
      actual = potential_board.get_value(spot.to_i - 1)
      expect(actual).to eq(9)
    end
  end

  describe ' #return_score(current_move, scores, moves)' do
    it 'should return 0 as it is the largest digit in scores array' do
      @computer.define_opponent('X')
      current_move = 'X'
      scores = [0, -8, -8, -8]
      moves = [4, 6, 8, 9]
      actual = @computer.return_score(current_move, scores, moves)
      expect(actual).to eq(0)
    end
    it 'shoul do something' do
      @computer.define_opponent('X')
      current_move = 'O'
      scores = [0, -8, -8, -8]
      moves = [4, 6, 8, 9]
      actual = @computer.return_score(current_move, scores, moves)
      expect(actual).to eq(-8)
    end
  end

  describe '#get_random_move(board)' do
    it 'should return a random number from 6, 7, 9, 4' do
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
      board = Board.new(@ui, @markers)
      board.insert_value(2, 'O')
      board.insert_value(0, 'O')
      board.insert_value(4, 'X')
      board.insert_value(7, 'X')
      board.insert_value(1, 'O')
      actual = @computer.get_random_move(board)
      expect(actual).to eq('7') | eq('6') | eq('9') | eq('4')
    end
  end

  describe '#get_move_score(board, last_move, depth)' do
    it 'should return 0 if the board is tie' do
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
      board = Board.new(@ui, @markers)
      board.insert_value(2, 'O')
      board.insert_value(0, 'X')
      board.insert_value(4, 'O')
      board.insert_value(7, 'O')
      board.insert_value(1, 'X')
      board.insert_value(3, 'O')
      board.insert_value(5, 'X')
      board.insert_value(6, 'X')
      board.insert_value(8, 'X')
      last_move = 'X'
      depth = 1
      actual = @computer.get_move_score(board, last_move, depth)
      expect(actual).to eq(0)
    end

    it 'should return -9 if the board is win depth is 1 and current move is opponents' do
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
      board = Board.new(@ui, @markers)
      board.insert_value(2, 'O')
      board.insert_value(0, 'O')
      board.insert_value(4, 'X')
      board.insert_value(7, 'X')
      board.insert_value(1, 'O')
      @computer.define_opponent('X')
      last_move = 'O'
      depth = 1
      actual = @computer.get_move_score(board, last_move, depth)
      expect(actual).to eq(-9)
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
end
