require 'spec_helper'
require_relative '../lib/console/user_interaction'

describe UserInteraction do
  before do
    @input = UserInteraction.new
  end

  describe '#get_input' do
    it 'should return input string' do
      allow_any_instance_of(UserInteraction).to receive(:get_input).and_return('input string')
      actual = @input.get_input
      expect(actual).to eq('input string')
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
end
