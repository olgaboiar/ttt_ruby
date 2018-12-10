require 'spec_helper'
require_relative '../lib/player'

describe Player do
  before do
    @markers = Marker.new
    @ui = UserInteraction.new
    @player = Player.new(@ui, @markers)
  end

  describe ' #move(board, symbol)' do
    it 'should return X if the argument passed is O' do
      @ui.choose_translation('1')
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
      board = Board.new(@input, @markers)
      board.insert_value(3, 'X')
      marker = 'O'
      allow_any_instance_of(Player).to receive(:set_spot).and_return(3, 2)
      expect do
        @player.move(board, marker)
      end.to output("That space is taken! Please select another cell\n").to_stdout
    end
  end

  describe ' #define_symbol(marker)' do
    it 'should return X if the argument passed is O' do
      # player = Player.new(@ui, @markers)
      marker = 'O'
      actual = @player.define_symbol(marker)
      expect(actual).to eq('X')
    end
    it 'should return O if the argument passed is X' do
      # player = Player.new(@ui, @markers)
      marker = 'X'
      actual = @player.define_symbol(marker)
      expect(actual).to eq('O')
    end
  end

  describe ' #create_player(player)' do
    it 'should create Computer class object when 2 is passed as an argument' do
      player = '2'
      allow_any_instance_of(Player).to receive(:set_difficulty_level).and_return('2')
      actual = @player.create_player(player)
      expect(actual).to be_instance_of(Computer)
    end

    it 'should create Human class object when 1 is passed as an argument' do
      player = '1'
      allow_any_instance_of(Player).to receive(:set_user_name).and_return('Mike')
      actual = @player.create_player(player)
      expect(actual).to be_instance_of(Human)
    end
  end

  describe ' #set_user_name' do
    it 'should return string Joe when Joe is passed as an argument' do
      allow_any_instance_of(UserInteraction).to receive(:user_name)
      allow_any_instance_of(UserInteraction).to receive(:read_input).and_return('Joe')
      actual = @player.set_user_name
      expect(actual).to eq('Joe')
    end

    it 'shoudl return Joe when ### and Joe is passed as an argument' do
      allow_any_instance_of(UserInteraction).to receive(:user_name)
      allow_any_instance_of(UserInteraction).to receive(:read_input).and_return('###', 'Joe')
      actual = @player.set_user_name
      expect(actual).to eq('Joe')
    end
  end

  describe ' #set_difficulty_level' do
    it 'should return 1 when 1 is passed as an argument' do
      allow_any_instance_of(UserInteraction).to receive(:difficulty_level)
      allow_any_instance_of(UserInteraction).to receive(:read_input).and_return('1')
      actual = @player.set_difficulty_level
      expect(actual).to eq(1)
    end

    it 'shoudl return 2 when 3 and 2 is passed as an argument' do
      allow_any_instance_of(UserInteraction).to receive(:difficulty_level)
      allow_any_instance_of(UserInteraction).to receive(:read_input).and_return('3', '2')
      actual = @player.set_difficulty_level
      expect(actual).to eq(2)
    end
  end
end
