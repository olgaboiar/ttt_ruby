require_relative "../lib/computer"

describe Computer do
  before do
    @markers = Marker.new
    @ui = UserInteraction.new
    difficulty = 2
    @computer = Computer.new(@ui, @markers, "Computer", difficulty)
  end

  describe "#set_opponent(symbol)" do
    it "should return O" do
      @computer.set_opponent("X")
      actual = @computer.opponent
      expect(actual).to eq("O")
    end
  end

  describe "#opponent" do
    it "should return X" do
      @computer.set_opponent("O")
      actual = @computer.opponent
      expect(actual).to eq("X")
    end
  end

  describe "#next_player(last_move)" do
    it "should return O" do
      marker = @computer.set_opponent("X")       
      actual = @computer.next_player(marker)
      expect(actual).to eq("O")
    end
    it "should return O" do
      marker = @computer.set_opponent("O")       
      actual = @computer.next_player(marker)
      expect(actual).to eq("X")
    end
  end
    
end   