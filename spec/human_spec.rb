require_relative "../lib/human"

describe Human do
  before do
    @input = UserInteraction.new
    language = Language.new(@input)
    allow_any_instance_of(Language).to receive(:set_lang).and_return("1")
    @player = Human.new(@input, "Valerie")
    allow_any_instance_of(UserInteraction).to receive(:puts).and_return(nil)
    allow_any_instance_of(Human).to receive(:set_spot).and_return(5)
  end

  describe "#move(board, symbol)" do
    it "should return uppercase X" do
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return("3")
      markers = Marker.new
      @board = Board.new(@input, markers)
      board_size = BoardSize.new(@input)
      @setup = Setup.new(board_size.set_size)
      actual = @player.move(@board, "X")
      expect(actual).to eq("X")
    end
    it "should return uppercase X" do
      allow_any_instance_of(BoardSize).to receive(:set_size).and_return("3")
      markers = Marker.new
      @board = Board.new(@input, markers)
      board_size = BoardSize.new(@input)
      @setup = Setup.new(board_size.set_size)
      actual = @player.move(@board, "O")
      expect(actual).to eq("O")
    end
  end
end