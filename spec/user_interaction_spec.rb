require 'spec_helper'
require_relative '../lib/console/user_interaction'

describe UserInteraction do
  before do
    @input = UserInteraction.new
  end

  describe '#read_input' do
    it 'should return input string' do
      allow_any_instance_of(UserInteraction).to receive(:read_input).and_return('input string')
      actual = @input.read_input
      expect(actual).to eq('input string')
    end
  end

  describe '#choose_lang' do
    it "should return the string prompting user to choose the language" do
      expect do
          @input.choose_lang
      end.to output("Choose the language: 1 - English, 2 - Ukrainian. \nEnter 1 or 2:\n").to_stdout
    end
  end

  describe '#valid_lang(lang)' do
    it 'should return true when number 1 is entered' do
      actual = @input.valid_lang('1')
      expect(actual).to be_truthy
    end

    it 'should return false when number 22 is entered' do
      actual = @input.valid_lang('22')
      expect(actual).to be_falsey
    end

    it 'should not return true when number 0 is entered' do
      actual = @input.valid_lang('0')
      expect(actual).to be_falsey
    end

    it 'should not return true when letter is entered' do
      actual = @input.valid_lang('j')
      expect(actual).to be_falsey
    end

    it 'should not return true when special character is entered' do
      actual = @input.valid_lang('~')
      expect(actual).to be_falsey
    end
  end

  describe '#valid_difficulty(lang)' do
    it 'should return true when number 1 is entered' do
      actual = @input.valid_difficulty('1')
      expect(actual).to be_truthy
    end

    it 'should return false when number 22 is entered' do
      actual = @input.valid_difficulty('22')
      expect(actual).to be_falsey
    end

    it 'should not return true when number 0 is entered' do
      actual = @input.valid_difficulty('0')
      expect(actual).to be_falsey
    end

    it 'should not return true when letter is entered' do
      actual = @input.valid_difficulty('j')
      expect(actual).to be_falsey
    end

    it 'should not return true when special character is entered' do
      actual = @input.valid_difficulty('~')
      expect(actual).to be_falsey
    end
  end

  describe '#valid_mode(mode)' do
    it 'should return true when number 1 is entered' do
      actual = @input.valid_mode('1')
      expect(actual).to be_truthy
    end

    it 'should return false when number 22 is entered' do
      actual = @input.valid_mode('22')
      expect(actual).to be_falsey
    end

    it 'should not return true when number 0 is entered' do
      actual = @input.valid_mode('0')
      expect(actual).to be_falsey
    end

    it 'should not return true when number 5 is entered' do
      actual = @input.valid_mode('5')
      expect(actual).to be_falsey
    end

    it 'should not return true when letter is entered' do
      actual = @input.valid_mode('j')
      expect(actual).to be_falsey
    end

    it 'should not return true when special character is entered' do
      actual = @input.valid_mode('~')
      expect(actual).to be_falsey
    end
  end

  describe '#valid_name(name)' do
    it 'should return true when dashed name is entered' do
      actual = @input.valid_name('Anna-Marie')
      expect(actual).to be_truthy
    end

    it 'should return false when #name is entered' do
      actual = @input.valid_name('#Anna')
      expect(actual).to be_falsey
    end

    it 'should not return true when : is entered' do
      actual = @input.valid_name(':ann')
      expect(actual).to be_falsey
    end

    it 'should not return true when $ is entered' do
      actual = @input.valid_name('$anna')
      expect(actual).to be_falsey
    end

    it 'should not return true when * is entered' do
      actual = @input.valid_name('*')
      expect(actual).to be_falsey
    end

    it 'should not return true when special character is entered' do
      actual = @input.valid_name('~')
      expect(actual).to be_falsey
    end
  end

  describe '#valid(spot)' do
    it 'should return true when number 1 is entered' do
      actual = @input.valid('1')
      expect(actual).to be_truthy
    end

    it 'should return true when number 9 is entered' do
      actual = @input.valid('9')
      expect(actual).to be_truthy
    end

    it 'should not return true when number 0 is entered' do
      actual = @input.valid('0')
      expect(actual).to be_falsey
    end

    it 'should not return true when number 111 is entered' do
      actual = @input.valid('1111')
      expect(actual).to be_falsey
    end

    it 'should not return true when letter is entered' do
      actual = @input.valid('j')
      expect(actual).to be_falsey
    end

    it 'should not return true when special character is entered' do
      actual = @input.valid('~')
      expect(actual).to be_falsey
    end
  end

  describe '#positive(response)' do
    it 'should return true when y is entered' do
      actual = @input.positive('y')
      expect(actual).to be_truthy
    end

    it 'should return true when Y is entered' do
      actual = @input.positive('Y')
      expect(actual).to be_truthy
    end

    it 'should return nil when not-y letter is entered' do
      actual = @input.positive('v')
      expect(actual).to be_falsey
    end

    it 'should return nil when number is entered' do
      actual = @input.positive(4)
      expect(actual).to be_falsey
    end
  end

  describe 'computer_human(mode)' do
    it 'should return true when 1 is entered' do
      actual = @input.computer_human('1')
      expect(actual).to be_truthy
    end

    it 'should return nil when 2 is entered' do
      actual = @input.computer_human('2')
      expect(actual).to be_falsey
    end

    it 'should return nil when letter is entered' do
      actual = @input.computer_human('v')
      expect(actual).to be_falsey
    end
  end

  describe '#human(mode)' do
    it 'should return true when 2 is entered' do
      actual = @input.human('2')
      expect(actual).to be_truthy
    end

    it 'should return nil when 3 is entered' do
      actual = @input.human('3')
      expect(actual).to be_falsey
    end

    it 'should return nil when letter is entered' do
      actual = @input.human('v')
      expect(actual).to be_falsey
    end
  end

  describe '#computer(mode)' do
    it 'should return true when 3 is entered' do
      actual = @input.computer('3')
      expect(actual).to be_truthy
    end

    it 'should return false when 1 is entered' do
      actual = @input.computer('1')
      expect(actual).to be_falsey
    end

    it 'should return nil when etter is entered' do
      actual = @input.computer('v')
      expect(actual).to be_falsey
    end
  end

  describe '#check_symbol' do
    it 'should return uppercase X' do
      actual = @input.check_symbol('x')
      expect(actual).to eq('X')
    end

    it 'should return uppercase O' do
      actual = @input.check_symbol('o')
      expect(actual).to eq('O')
    end

    it 'should return nil when input is a letter that is not X or O' do
      actual = @input.check_symbol('c')
      expect(actual).to be_nil
    end

    it 'should return nil when input is a number' do
      actual = @input.check_symbol('2')
      expect(actual).to be_nil
    end

    it 'should return nil when input is a special character' do
      actual = @input.check_symbol('~')
      expect(actual).to be_nil
    end
  end

  describe '#check_size(argument)' do
    it 'should return nil when number 1 is entered' do
      actual = @input.check_size('1')
      expect(actual).to be_falsey
    end

    it 'should return true when number 9 is entered' do
      actual = @input.check_size('9')
      expect(actual).to be_truthy
    end

    it 'should not return nil when number 0 is entered' do
      actual = @input.check_size('0')
      expect(actual).to be_falsey
    end

    it 'should not return nil when number 10 is entered' do
      actual = @input.check_size('10')
      expect(actual).to be_falsey
    end

    it 'should not return true when number 2 is entered' do
      actual = @input.check_size('2')
      expect(actual).to be_truthy
    end

    it 'should not return nil when letter is entered' do
      actual = @input.check_size('j')
      expect(actual).to be_falsey
    end

    it 'should not return nil when special character is entered' do
      actual = @input.check_size('~')
      expect(actual).to be_falsey
    end
  end

  # describe ' #choose_translation(lang)' do
  #   it 'should choose ukrainian yaml file for translations if 2 is passed as an argument' do
  #     actual = @input.choose_translation('2')
  #     # expect(actual).to be_falsey
  #     expect(actual).to eq(YAML.load_file(File.join(__dir__, '../lib/lang/ua.yml')))
  #   end
  #   it 'should choose ukrainian yaml file for translations if 2 is passed as an argument' do
  #     actual = @input.choose_translation('1')
  #     # expect(actual).to be_falsey
  #     expect(actual).to eq(YAML.load_file(File.join(__dir__, '../lib/lang/en.yml')))
  #   end
  # end
end
