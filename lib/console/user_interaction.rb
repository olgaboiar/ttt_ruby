require 'yaml'

class UserInteraction
    
  def get_input
    gets.chomp
  end

  def choose_lang
    puts "Choose the language: 1 - English, 2 - Ukrainian. \nEnter 1 or 2:"
  end

  def valid_lang(lang)
    return true if lang.to_i < 3 and lang.to_i > 0
  end

  def valid(spot)
    return true if spot.to_i < 17 and spot.to_i > 0
  end

  def positive(response)
    return true if response =~ /^[y|Y]$/
  end

  def check_symbol(symbol)
    return symbol.upcase if symbol =~ /^[x|X|o|O]$/
  end

  def check_size(argument)
    return argument if argument.to_i <= 9 and argument.to_i > 1
    return nil
  end

  def set_translation(language)
    @trans = YAML::load_file(File.join(__dir__, '../languages/en.yml')) if language == "1"
    @trans = YAML::load_file(File.join(__dir__, '../languages/ua.yml')) if language == "2"

  end

  def greeting
    puts @trans[:greeting]
  end

  def first(player)
    puts player + " " + @trans[:first]
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
    puts @trans[:computer_move] + " " + spot.to_s + " " + @trans[:your_move]
  end

  def great_move
    puts @trans[:great_move]
  end

  def tie
    puts @trans[:tie]
  end

  def declaring_winner(winner)
    puts winner + " " +  @trans[:declaring_winner]
  end

  def game_over
    puts @trans[:game_over]
  end

  def bye
    puts @trans[:bye]
  end
end