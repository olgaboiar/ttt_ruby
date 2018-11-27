class Language

  def initialize(ui)
    @ui = ui
  end

  def set_lang
    lang = nil
    @ui.choose_lang
    until lang
      lang = @ui.get_input
      return lang if @ui.valid_lang(lang)
      @ui.choose_lang
      lang = nil
    end
  end
end
