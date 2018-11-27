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



# describe UserMessages do
#   before do
#     @messagesen = UserMessages.new('1')
#     @messagesua = UserMessages.new('2')
#   end

#   describe '#greeting' do
#     it 'should return greeting string' do
#       expect do
#           @messagesen.greeting
#       end.to output('Hi! Do you want to play a game of tic-tac-toe? Enter Y to play or any other key to quit\n').to_stdout
#     end
#     it 'should return greeting string' do
#       expect do
#           @messagesua.greeting
#       end.to output('Привіт! Пограємо в хрестики-нулики? Натисни Y щоб грати або будь-яку іншу клавішу щоб закрити програму\n').to_stdout
#     end
#   end

#   describe '#choosing_symbol' do
#     it 'should return a question to choose a symbol string' do
#       expect do
#         @messagesen.choosing_symbol
#       end.to output('Choose the symbol you want to play with - X or O?\n').to_stdout
#     end
#     it 'should return a question to choose a symbol string' do
#       expect do
#         @messagesua.choosing_symbol
#       end.to output('Обери символ, яким ти хочеш грати - X чи O?\n').to_stdout
#     end
#   end

#   describe '#entering_number' do
#     it 'should return entering number string' do
#       expect do
#         @messagesen.entering_number
#       end.to output('Enter a number from 1 to 9 to make your move\n').to_stdout
#     end
#     it 'should return entering number string' do
#       expect do
#         @messagesua.entering_number
#       end.to output('Введи цифру від 1 до 9 щоб обрати місце для ходу\n').to_stdout
#     end
#   end

#   describe '#choosing_size' do
#     it 'should return choosing size string' do
#       expect do
#         @messagesen.choosing_size
#       end.to output('Enter a number from 2 to 9 to cnoose your board size\n').to_stdout
#     end
#     it 'should return choosing size string' do
#       expect do
#         @messagesua.choosing_size
#       end.to output('Введи цифру від 2 до 9 щоб визначити розмір для поля гри\n').to_stdout
#     end
#   end

#   describe '#space_taken' do
#     it 'should return space taken error string' do
#       expect do
#         @messagesen.space_taken
#       end.to output('That space is taken! Please select another cell\n').to_stdout
#     end
#     it 'should return space taken error string' do
#       expect do
#         @messagesua.space_taken
#       end.to output('Це місце вже зайнято! Будь ласка обери інше місце\n').to_stdout
#     end
#   end

#   describe '#computer_move' do
#     it 'should return computer move string' do
#       expect do
#         @messagesen.computer_move
#       end.to output('Computer just made a move. It's your turn now!\n').to_stdout
#     end
#     it 'should return computer move string' do
#       expect do
#         @messagesua.computer_move
#       end.to output('Комп щойно здійснив свій хід. Тепер твоя черга!\n').to_stdout
#     end
#   end

#   describe '#great_move' do
#     it 'should return great move string' do
#       expect do
#         @messagesen.great_move
#       end.to output('Great move!\n').to_stdout
#     end
#     it 'should return great move string' do
#       expect do
#         @messagesua.great_move
#       end.to output('Чудовий хід!\n').to_stdout
#     end
#   end

#   describe '#tie' do
#     it 'should return tie message stirung string' do
#       expect do
#         @messagesen.tie
#       end.to output('It's a tie! Let's play again!\n').to_stdout
#     end
#     it 'should return tie message stirung string' do
#       expect do
#         @messagesua.tie
#       end.to output('Нічия! Давай зіграємо ще!\n').to_stdout
#     end
#   end

#   describe '#declaring_winner' do
#     it 'should declare X as winner' do
#       expect do
#         @messagesen.declaring_winner('X')
#       end.to output('X wins!\n').to_stdout
#     end
#     it 'should declare X as winner' do
#       expect do
#         @messagesua.declaring_winner('X')
#       end.to output('X переміг!\n').to_stdout
#     end
#   end

#   describe '#game_over' do
#     it 'should return game over message string' do
#       expect do
#         @messagesen.game_over
#       end.to output('Game over!\n').to_stdout
#     end
#     it 'should return game over message string' do
#       expect do
#         @messagesua.game_over
#       end.to output('Гру закінчено!\n').to_stdout
#     end
#   end

#   describe '#bye' do
#     it 'should return bye string' do
#       expect do
#         @messagesen.bye
#       end.to output('Bye!\n').to_stdout
#     end
#     it 'should return bye string' do
#       expect do
#         @messagesua.bye
#       end.to output('Па!\n').to_stdout
#     end
#   end
# end
