require_relative "../lib/board_size"

describe BoardSize do
    
  before do
    @input = UserInput.new
    language = Language.new(@input)
    allow_any_instance_of(Language).to receive(:set_lang).and_return("1")
    @messages = UserMessages.new(language.set_lang)
    allow_any_instance_of(UserMessages).to receive(:choosing_size)
  end

  describe "#set_size" do
    it "should return 3 as a board size" do
      allow(@input).to receive(:get_input).and_return("3")
      board_size = BoardSize.new(@input,@messages)
      actual = board_size.set_size
      expect(actual).to eq("3")
    end
    it "should return 5 as a board size" do
      allow_any_instance_of(UserInput).to receive(:get_input).and_return("5")
      board_size = BoardSize.new(@input,@messages)
      actual = board_size.set_size
      expect(actual).to eq("5")
    end
  end
end