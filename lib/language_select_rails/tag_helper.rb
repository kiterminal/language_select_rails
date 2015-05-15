module LanguageSelectRails
  class LanguageNotFoundError < StandardError; end

  module TagHelper
    def language_option_tags
      option_tags_options = {
        selected: @options.fetch(:selected) { value(@object) },
        disabled: @options[:disabled]
      }

      options_for_select(language_options, option_tags_options)
    end

    private

    def locale
      @options[:locale] || I18n.locale.to_s
    end

    def only_languages
      @options[:only].map { |language| language.to_s.upcase } if @options[:only]
    end

    def except_languages
      @options[:except].map { |language| language.to_s.upcase } if @options[:except]
    end

    def language_options
      language_codes.map { |code, name| [name, code.downcase] }
    end

    def language_codes
      languages = I18nData.languages(locale).dup

      if only_languages.present?
        languages.keep_if { |code, _name| only_languages.include?(code) }
      elsif except_languages.present?
        languages.delete_if { |code, _name| except_languages.include?(code) }
      else
        languages
      end

      languages.sort_by(&:last)
    end
  end
end
