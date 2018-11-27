require_relative "../lib/language"

describe Language do
  before do
    @input = UserInteraction.new
    @language = Language.new(@input)
    allow_any_instance_of(UserInteraction).to receive(:choose_lang)
  end

  describe "#set_lang" do
    it "should return 1 as a player's language choice" do
      allow_any_instance_of(UserInteraction).to receive(:read_input).and_return("1")
      actual = @language.set_lang
      expect(actual).to eq("1")
    end
    it "should return 2 as a player's language choice" do
      allow_any_instance_of(UserInteraction).to receive(:read_input).and_return("2")
      actual = @language.set_lang
      expect(actual).to eq("2")
    end
  end
end
