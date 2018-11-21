require_relative "../lib/human"

describe Human do
  before do
    @input = UserInteraction.new
    language = Language.new(@input)
    allow_any_instance_of(Language).to receive(:set_lang).and_return("1")
    @player = Human.new(@input, "Valerie")
    allow_any_instance_of(UserInteraction).to receive(:puts).and_return(nil)
  end

  # describe "#set_symbol" do
  #   it "should return X as a player's symbol" do
  #     allow_any_instance_of(UserInteraction).to receive(:get_input).and_return("x")
  #     actual = @player.set_symbol
  #     expect(actual).to eq("X")
  #   end
  #   it "should return O as a player's symbol" do
  #     allow_any_instance_of(UserInteraction).to receive(:get_input).and_return("O")
  #     actual = @player.set_symbol
  #     expect(actual).to eq("O")
  #   end
  # end

  describe "#move(board, symbol, spot)" do
    it "should return uppercase X" do
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return("3")
      markers = Marker.new
      @board = Board.new(@input, markers)
      board_size = BoardSize.new(@input)
      @setup = Setup.new(board_size.set_size)
      actual = @player.move(@board, "X", 1)
      expect(actual).to eq("X")
    end
    it "should return uppercase X" do
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return("3")
      markers = Marker.new
      @board = Board.new(@input, markers)
      board_size = BoardSize.new(@input)
      @setup = Setup.new(board_size.set_size)
      actual = @player.move(@board, "O", 5)
      expect(actual).to eq("O")
    end
  end
end