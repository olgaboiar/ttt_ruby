class Language

  def initialize(input)
    @input = input
  end

  def set_lang
    lang = nil
    @input.choose_lang
    until lang
      lang = @input.get_input
      return lang if @input.valid_lang(lang)
      @input.choose_lang
      lang = nil
    end
  end
end