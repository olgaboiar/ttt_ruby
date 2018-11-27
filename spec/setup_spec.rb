require_relative '../lib/console/marker'

describe Setup do
    
  before do
    allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
    markers = Marker.new
    @board = Board.new(@input, markers)
    @input = UserInteraction.new
    board_size = BoardSize.new(@input)
    @setup = Setup.new(board_size.set_size)
  end

  describe '#create_board_array' do
    it "should return ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16'] for 4x4 board" do
      actual = Setup.new(4).create_board_array
      expect(actual).to eq(['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16'])
    end
    it "should return ['1', '2', '3', '4'] for 2x2 board" do
      actual = Setup.new(2).create_board_array
      expect(actual).to eq(['1', '2', '3', '4'])
    end
    it "should return ['1', '2', '3', '4', '5', '6', '7', '8', '9'] for 3x3 board" do
      actual = Setup.new(3).create_board_array
      expect(actual).to eq(['1', '2', '3', '4', '5', '6', '7', '8', '9'])
    end
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

  describe '#win' do
    it 'should return false when board is empty' do
      actual = @board.win
      expect(actual).to be_falsey
    end
    it 'should return false when no winning position is reached'  do
      @board.insert_value(1, 'X')
      @board.insert_value(2, '0')
      actual = @board.win
      expect(actual).to be_falsey
    end
    it 'should return true when horizontal winning position is reached' do
      @board.insert_value(1, 'X')
      @board.insert_value(4, '0')
      @board.insert_value(0, 'X')
      @board.insert_value(6, '0')
      @board.insert_value(2, 'X')
      actual = @board.win
      expect(actual).to be_truthy
    end
    it 'should return true when vertical winning position is reached' do
      @board.insert_value(1, 'X')
      @board.insert_value(0, '0')
      @board.insert_value(4, 'X')
      @board.insert_value(6, '0')
      @board.insert_value(7, 'X')
      actual = @board.win
      expect(actual).to be_truthy
    end
    it 'should return true when diagonal winning position is reached' do
      @board.insert_value(2, 'X')
      @board.insert_value(0, '0')
      @board.insert_value(4, 'X')
      @board.insert_value(7, '0')
      @board.insert_value(6, 'X')
      actual = @board.win
      expect(actual).to be_truthy
    end
  end
end
