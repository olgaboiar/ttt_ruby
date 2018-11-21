require_relative "../lib/tictactoe"

describe TicTacToe do
    
  before do
    player1 = Human.new(@input, "Vasya")
    player2 = Human.new(@input, "Ivan")
    allow_any_instance_of(BoardSize).to receive(:set_size).and_return("3")
    @input = UserInteraction.new
    markers = Marker.new
    @board = Board.new(@input, markers)
    board_size = BoardSize.new(@input)
    @setup = Setup.new(board_size.set_size)
    @tictactoe = TicTacToe.new(player1, player2, @board, @input)
  end

  describe "#print_board" do
    it "should print tictactoe board" do
      expect do
        @tictactoe.print_board
      end.to output(" \n  1 |  2 |  3 |\n----+----+----+\n  4 |  5 |  6 |\n----+----+----+\n  7 |  8 |  9 |\n----+----+----+\n").to_stdout
    end
  end

  # describe "#declare_winner" do
  #   it "should return a string declaring X as a winner" do
  #     @board.insert_value(1, "X")
  #     @board.insert_value(4, "O")
  #     @board.insert_value(0, "X")
  #     @board.insert_value(6, "O")
  #     @board.insert_value(2, "X")
  #     expect do
  #       @tictactoe.declare_winner
  #     end.to output("X wins!\n").to_stdout
  #   end

  #   it "should return a string declaring O as a winner" do
  #     @board.insert_value(2, "O")
  #     @board.insert_value(0, "X")
  #     @board.insert_value(4, "O")
  #     @board.insert_value(7, "X")
  #     @board.insert_value(6, "O")
  #     expect do
  #       @tictactoe.declare_winner
  #     end.to output("O wins!\n").to_stdout
  #   end
  # end
end