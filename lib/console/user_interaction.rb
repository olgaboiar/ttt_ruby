require 'yaml'
# This class handles all console user interaction, all inputs and outputs
class UserInteraction
  def read_input
    gets.chomp
  end

  def choose_lang
    puts "Choose the language: 1 - English, 2 - Ukrainian. \nEnter 1 or 2:"
  end

  def valid_lang(lang)
    return true if lang.to_i < 3 && lang.to_i > 0
  end

  def valid_difficulty(difficulty)
    return true if difficulty.to_i < 3 && difficulty.to_i > 0
  end

  def valid_mode(mode)
    return true if mode.to_i < 4 && mode.to_i > 0
  end

  def valid_name(name)
    return true if name =~ /(^[\p{L}\s'.-]+$)/
  end

  def valid(spot)
    return true if spot.to_i < 17 && spot.to_i > 0
  end

  def positive(response)
    return true if response =~ /^[y|Y]$/
  end

  def computer_human(mode)
    return true if mode == '1'
  end

  def human(mode)
    return true if mode == '2'
  end

  def computer(mode)
    return true if mode == '3'
  end

  def check_symbol(symbol)
    return symbol.upcase if symbol =~ /^[x|X|o|O]$/
  end

  def check_size(argument)
    return argument if argument.to_i <= 9 && argument.to_i > 1
  end

  def choose_translation(lang)
    @trans = YAML.load_file(File.join(__dir__, '../lang/en.yml')) if lang == '1'
    @trans = YAML.load_file(File.join(__dir__, '../lang/ua.yml')) if lang == '2'
  end

  def greeting
    puts @trans[:greeting]
  end

  def game_mode
    puts @trans[:game_mode]
  end

  def user_name
    puts @trans[:user_name]
  end

  def set_other_user_name
    puts @trans[:other_user_name]
  end

  def difficulty_level(name)
    puts name + ', ' + @trans[:difficulty_level]
  end

  def first(player)
    puts player + ' ' + @trans[:first]
  end

  def board
    puts @trans[:board]
  end

  def choosing_symbol(name)
    puts name + ', ' + @trans[:choosing_symbol]
  end

  def entering_number
    puts @trans[:entering_number]
  end

  def choosing_size
    puts @trans[:choosing_size]
  end

  def space_taken
    puts @trans[:space_taken]
  end

  def computer_move(spot)
    puts @trans[:computer_move] + ' ' + spot.to_s + ' ' + @trans[:your_move]
  end

  def great_move
    puts @trans[:great_move]
  end

  def tie
    puts @trans[:tie]
  end

  def declaring_winner(winner)
    puts winner + ' ' + @trans[:declaring_winner]
  end

  def game_over
    puts @trans[:game_over]
  end

  def bye
    puts @trans[:bye]
  end
end
