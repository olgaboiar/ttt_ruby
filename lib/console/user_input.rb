class UserInput
    
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
end