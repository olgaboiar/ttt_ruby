require 'yaml'
# frozen_string_literal: true

# This class handles all console user interaction, all inputs and outputs
class UserInteraction
  def read_input
    gets.chomp
  end

  def choose_lang
    puts "Choose the language: 1 - English, 2 - Ukrainian. \nEnter 1 or 2:"
  end

  def valid_lang(lang)
    return true if lang.to_i < 3 && lang.to_i.positive?
  end

  def valid_difficulty(difficulty)
    return true if difficulty.to_i < 3 && difficulty.to_i.positive?
  end

  def valid_player(player)
    return true if player.to_i < 3 && player.to_i.positive?
  end

  def valid_name(name)
    return true if name =~ /(^[\p{L}\s'.-]+$)/
  end

  def valid(spot)
    return true if spot.to_i < 17 && spot.to_i.positive?
  end

  def positive(response)
    return true if response =~ /^[y|Y]$/
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

  def user_name
    puts @trans[:user_name]
  end

  def define_player(num)
    puts @trans[:def_player_st] + ' ' + num.to_s + ' ' + @trans[:def_player_end]
  end

  def difficulty_level
    puts @trans[:difficulty_level]
  end

  def first(player)
    puts player + ' ' + @trans[:first]
  end

  def board
    puts @trans[:board]
  end

  def choosing_symbol
    puts @trans[:choosing_symbol]
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
