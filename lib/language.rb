# This class allows user to select a language
class Language
  def initialize(userinteraction)
    @ui = userinteraction
  end

  def set_lang
    lang = nil
    @ui.choose_lang
    until lang
      lang = @ui.read_input
      return lang if @ui.valid_lang(lang)

      @ui.choose_lang
      lang = nil
    end
  end
end
