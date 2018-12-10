# frozen_string_literal: true

# This class allows user to select a language
class Language
  def initialize(userinteraction)
    @ui = userinteraction
  end

  def set_lang
    lang = nil
    until lang
      @ui.choose_lang
      lang = @ui.read_input
      return lang if @ui.valid_lang(lang)

      lang = nil
    end
  end
end
