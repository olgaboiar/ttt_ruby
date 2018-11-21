require 'yaml'

class UserMessages
  def initialize(language)
    @trans = YAML::load_file(File.join(__dir__, '../languages/en.yml')) if language == "1"
    @trans = YAML::load_file(File.join(__dir__, '../languages/ua.yml')) if language == "2"

  end

  def greeting
    puts @trans[:greeting]
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

  def computer_move
    puts @trans[:computer_move]
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