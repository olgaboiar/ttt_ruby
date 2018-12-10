# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/human'

describe Human do
  before do
    @input = UserInteraction.new
    @markers = Marker.new
    allow_any_instance_of(Language).to receive(:set_lang).and_return('1')
    @player = Human.new(@input, @markers, 'Valerie')
    allow_any_instance_of(UserInteraction).to receive(:puts).and_return(nil)
  end

  describe '#set_spot' do
    it 'should return 2 when 3 is passed as an argument' do
      allow_any_instance_of(UserInteraction).to receive(:entering_number)
      allow_any_instance_of(UserInteraction).to receive(:read_input).and_return(3)
      actual = @player.set_spot
      expect(actual).to eq(2)
    end
    it 'should return 2 when 25 and 3 are passed as an argument' do
      allow_any_instance_of(UserInteraction).to receive(:entering_number)
      allow_any_instance_of(UserInteraction).to receive(:read_input).and_return(25, 3)
      actual = @player.set_spot
      expect(actual).to eq(2)
    end
  end

  describe '#choose_symbol' do
    it 'should return 2 when 3 is passed as an argument' do
      allow_any_instance_of(UserInteraction).to receive(:choosing_symbol)
      allow_any_instance_of(UserInteraction).to receive(:read_input).and_return('x')
      actual = @player.choose_symbol
      expect(actual).to eq('X')
    end
    it 'should return 2 when 25 and 3 are passed as an argument' do
      allow_any_instance_of(UserInteraction).to receive(:choosing_symbol)
      allow_any_instance_of(UserInteraction).to receive(:read_input).and_return('m', 'o')
      actual = @player.choose_symbol
      expect(actual).to eq('O')
    end
  end

  describe '#move(board, symbol)' do
    it 'should return uppercase X' do
      allow_any_instance_of(Human).to receive(:set_spot).and_return(5)
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
      @board = Board.new(@input, @markers)
      board_size = BoardSize.new(@input)
      @setup = Setup.new(board_size.set_size)
      actual = @player.move(@board, 'X')
      expect(actual).to eq('X')
    end
    it 'should return uppercase X' do
      allow_any_instance_of(Human).to receive(:set_spot).and_return(5)
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
      @board = Board.new(@input, @markers)
      board_size = BoardSize.new(@input)
      @setup = Setup.new(board_size.set_size)
      actual = @player.move(@board, 'O')
      expect(actual).to eq('O')
    end
  end
end
