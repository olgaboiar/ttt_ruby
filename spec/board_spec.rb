# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/board'

describe Board do
  before do
    allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
    @markers = Marker.new
    @input = UserInteraction.new
    allow_any_instance_of(Language).to receive(:set_lang).and_return('1')
    @board = Board.new(@input, @markers)
    @board_size = BoardSize.new(@input)
    @setup = Setup.new(@board_size.set_size)
  end

  describe '#print_board' do
    it 'should print out 2x2 board' do
      expect do
        actual = Setup.new(2)
        @board = actual.create_board_array
        actual.print_board
      end.to output(" \n  1 |  2 |\n----+----+\n  3 |  4 |\n----+----+\n").to_stdout
    end
    it 'should print out 4x4 board' do
      expect do
        actual = Setup.new(4)
        @board = actual.create_board_array
        actual.print_board
      end.to output(" \n  1 |  2 |  3 |  4 |\n----+----+----+----+\n  5 |  6 |  7 |  8 |\n----+----+----+----+\n  9 | 10 | 11 | 12 |\n----+----+----+----+\n 13 | 14 | 15 | 16 |\n----+----+----+----+\n").to_stdout
    end
  end

  describe '#game_over' do
    it 'should return false when board is empty' do
      actual = @board.game_over
      expect(actual).to be_falsey
    end
    it 'should return false when no winning position is reached' do
      @board.insert_value(1, 'X')
      @board.insert_value(2, 'O')
      actual = @board.game_over
      expect(actual).to be_falsey
    end
    it 'should return true when horizontal winning position is reached' do
      @board.insert_value(1, 'X')
      @board.insert_value(4, 'O')
      @board.insert_value(0, 'X')
      @board.insert_value(6, 'O')
      @board.insert_value(2, 'X')
      actual = @board.game_over
      expect(actual).to be_truthy
    end
    it 'should return true when tie is reached' do
      @board.insert_value(1, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(6, 'O')
      @board.insert_value(7, 'X')
      @board.insert_value(3, 'O')
      @board.insert_value(2, 'X')
      @board.insert_value(5, 'O')
      @board.insert_value(8, 'X')
      actual = @board.game_over
      expect(actual).to be_truthy
    end
  end

  describe '#win' do
    it 'should return false when board is empty' do
      actual = @board.win
      expect(actual).to be_falsey
    end
    it 'should return false when no winning position is reached' do
      @board.insert_value(1, 'X')
      @board.insert_value(2, 'O')
      actual = @board.win
      expect(actual).to be_falsey
    end
    it 'should return true when horizontal winning position is reached' do
      @board.insert_value(1, 'X')
      @board.insert_value(4, 'O')
      @board.insert_value(0, 'X')
      @board.insert_value(6, 'O')
      @board.insert_value(2, 'X')
      actual = @board.win
      expect(actual).to be_truthy
    end
    it 'should return true when vertical winning position is reached' do
      @board.insert_value(1, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(6, 'O')
      @board.insert_value(7, 'X')
      actual = @board.win
      expect(actual).to be_truthy
    end
    it 'should return true when diagonal winning position is reached' do
      @board.insert_value(2, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(7, 'O')
      @board.insert_value(6, 'X')
      actual = @board.win
      expect(actual).to be_truthy
    end
  end

  describe '#get_value' do
    it 'should return X as the value of the first cell on the given board' do
      @board.insert_value(0, 'X')
      @board.insert_value(1, 'O')
      actual = @board.get_value(0)
      expect(actual).to eq('X')
    end
    it 'should return 1 as the value of the first cell on the empty board' do
      expect(@board.get_value(0)).to eq('1')
    end
    it 'should return O as the value of the second cell on the given board' do
      @board.insert_value(0, 'X')
      @board.insert_value(1, 'O')
      actual = @board.get_value(1)
      expect(actual).to eq('O')
    end
  end

  describe '#insert_value' do
    it 'should return 1 as the value of the first cell on the given board' do
      actual = @board.get_value(0)
      expect(actual).to eq('1')
    end
    it 'should return 4 as the value of the fourth cell on the empty board' do
      actual = @board.get_value(3)
      expect(actual).to eq('4')
    end
    it 'should return O as the value of the first cell on the given board' do
      @board.insert_value(0, 'O')
      actual = @board.get_value(0)
      expect(actual).to eq('O')
    end
  end

  describe '#valid(spot)' do
    it 'should return true for a non X or O spot' do
      actual = @board.valid(@board.get_value(1))
      expect(actual).to be(true)
    end
    it 'should return false for the X spot' do
      @board.insert_value(0, 'X')
      actual = @board.valid(@board.get_value(0))
      expect(actual).to be(false)
    end
    it 'should return false for the O spot' do
      @board.insert_value(5, 'O')
      actual = @board.valid(@board.get_value(5))
      expect(actual).to be(false)
    end
  end

  describe '#available_spots' do
    it "should return ['3', '4', '6', '9']" do
      @board.insert_value(1, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(6, 'O')
      actual = @board.available_spots
      expect(actual).to eq(%w[3 4 6 8 9])
    end
    it 'should return empty array' do
      @board.insert_value(2, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(7, 'O')
      @board.insert_value(1, 'X')
      @board.insert_value(3, 'O')
      @board.insert_value(5, 'X')
      @board.insert_value(6, 'O')
      @board.insert_value(8, 'X')
      actual = @board.available_spots
      expect(actual).to eq([])
    end
    it 'should return an array of 1-9' do
      actual = @board.available_spots
      expect(actual).to eq(%w[1 2 3 4 5 6 7 8 9])
    end
  end
end
