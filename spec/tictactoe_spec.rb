require_relative '../lib/tictactoe'

describe TicTacToe do
  before do
    human = Human.new(@input, 'Vasya')
    computer = Human.new(@input, 'Ivan')
    allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
    @input = UserInteraction.new
    markers = Marker.new
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
end
