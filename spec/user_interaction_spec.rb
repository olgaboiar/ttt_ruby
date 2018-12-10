# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/console/user_interaction'

describe UserInteraction do
  before do
    @input = UserInteraction.new
  end

  describe '#read_input' do
    it 'should return input string' do
      allow_any_instance_of(UserInteraction).to receive(:gets).and_return('input string')
      actual = @input.read_input
      expect(actual).to eq('input string')
    end
  end

  describe '#choose_lang' do
    it 'should return the string prompting user to choose the language' do
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

  describe '#valid_player(player)' do
    it 'should return true when number 1 is entered' do
      actual = @input.valid_player('1')
      expect(actual).to be_truthy
    end

    it 'should return false when number 22 is entered' do
      actual = @input.valid_player('22')
      expect(actual).to be_falsey
    end

    it 'should not return true when number 0 is entered' do
      actual = @input.valid_player('0')
      expect(actual).to be_falsey
    end

    it 'should not return true when number 5 is entered' do
      actual = @input.valid_player('5')
      expect(actual).to be_falsey
    end

    it 'should not return true when letter is entered' do
      actual = @input.valid_player('j')
      expect(actual).to be_falsey
    end

    it 'should not return true when special character is entered' do
      actual = @input.valid_player('~')
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

  describe ' #choose_translation(lang)' do
    it 'should choose ukrainian yaml file for translations if 2 is passed as an argument' do
      actual = @input.choose_translation('2')
      expect(actual).to eq(YAML.load_file(File.join(__dir__, '../lib/lang/ua.yml')))
    end
  end

  describe '#greeting' do
    it 'should return ukrainian greeting string' do
      @input.choose_translation('2')
      expect do
        @input.greeting
      end.to output("Привіт! Пограємо в хрестики-нулики? Натисни Y щоб грати або будь-яку іншу клавішу щоб закрити програму\n").to_stdout
    end
  end

  describe '#user_name' do
    it 'should return ukrainian user_name string' do
      @input.choose_translation('2')
      expect do
        @input.user_name
      end.to output("Введіть своє імя\n").to_stdout
    end
  end

  describe '#define_player(num)' do
    it 'should return english string for defining player 1 when 1 is passed' do
      @input.choose_translation('1')
      expect do
        @input.define_player('1')
      end.to output("Is player 1 Human or Computer? Enter 1 for Human and 2 for Computer\n").to_stdout
    end
  end

  describe '#difficulty_level' do
    it 'should return english difficulty_level string' do
      @input.choose_translation('1')
      expect do
        @input.difficulty_level
      end.to output("Choose the difficulty level for computer logic. Enter 1 for Easy and 2 for Hard\n").to_stdout
    end
  end

  describe '#first(player)' do
    it 'should return english string stating who goes first' do
      @input.choose_translation('1')
      expect do
        player = 'Computer'
        @input.first(player)
      end.to output("Computer goes first!\n").to_stdout
    end
  end

  describe '#board' do
    it 'should return english board string' do
      @input.choose_translation('1')
      expect do
        @input.board
      end.to output("Here is your playing board!\n").to_stdout
    end
  end

  describe '#choosing_symbol' do
    it 'should return ukrainian choosing_symbol string' do
      @input.choose_translation('2')
      expect do
        @input.choosing_symbol
      end.to output("Обери символ, яким ти хочеш грати - X чи O?\n").to_stdout
    end
  end

  describe '#entering_number' do
    it 'should return ukrainian entering_number string' do
      @input.choose_translation('2')
      expect do
        @input.entering_number
      end.to output("Введи цифру від 1 до 9 щоб обрати місце для ходу\n").to_stdout
    end
  end

  describe '#choosing_size' do
    it 'should return ukrainian choosing_size string' do
      @input.choose_translation('2')
      expect do
        @input.choosing_size
      end.to output("Введи цифру від 2 до 9 щоб визначити розмір для поля гри\n").to_stdout
    end
  end

  describe '#space_taken' do
    it 'should return ukrainian space_taken string' do
      @input.choose_translation('2')
      expect do
        @input.space_taken
      end.to output("Це місце вже зайнято! Будь ласка обери інше місце\n").to_stdout
    end
  end

  describe '#computer_move(spot)' do
    it 'should return ukrainian computer_move(spot) string' do
      @input.choose_translation('2')
      expect do
        @input.computer_move(1)
      end.to output("Комп щойно здійснив свій хід 1 Тепер твоя черга!\n").to_stdout
    end
  end

  describe '#great_move' do
    it 'should return english great_move string' do
      @input.choose_translation('1')
      expect do
        @input.great_move
      end.to output("Great move!\n").to_stdout
    end
  end

  describe '#tie' do
    it 'should return english tie string' do
      @input.choose_translation('1')
      expect do
        @input.tie
      end.to output("It's a tie! Let's play again!\n").to_stdout
    end
  end

  describe '#declaring_winner(winner)' do
    it 'should return english declaring X as a winner string' do
      @input.choose_translation('1')
      expect do
        @input.declaring_winner('X')
      end.to output("X wins!\n").to_stdout
    end
  end

  describe '#game_over' do
    it 'should return english game_over string' do
      @input.choose_translation('1')
      expect do
        @input.game_over
      end.to output("Game over!\n").to_stdout
    end
  end

  describe '#bye' do
    it 'should return english bye string' do
      @input.choose_translation('1')
      expect do
        @input.bye
      end.to output("Bye!\n").to_stdout
    end
  end
end
