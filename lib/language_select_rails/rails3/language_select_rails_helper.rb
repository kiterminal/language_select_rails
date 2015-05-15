module ActionView
  module Helpers
    class FormBuilder
      def language_select(method, options = {}, html_options = {})
        @template.language_select @object_name, method, objectify_options(options), @default_options.merge(html_options)
      end
    end

    module FormOptionsHelper
      def language_select(object, method, options = {}, html_options = {})
        LanguageSelectRails.new(object, method, self, options.delete(:object)).render(options, html_options)
      end
    end

    class LanguageSelectRails < InstanceTag
      include ::LanguageSelectRails::TagHelper

      def render(options, html_options)
        @options = options
        @html_options = html_options

        if self.respond_to?(:select_content_tag)
          select_content_tag language_option_tags, @options, @html_options
        else
          html_options = @html_options.stringify_keys
          add_default_name_and_id html_options
          content_tag :select, add_options(language_option_tags, options, value(object)), html_options
        end
      end
    end
  end
end
