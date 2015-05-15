# encoding: utf-8

require 'spec_helper'
require 'action_view'
require 'language_select_rails'

describe LanguageSelectRails do
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormOptionsHelper

  class User
    attr_accessor :language
  end

  let(:user) { User.new }
  let!(:template) { ActionView::Base.new }

  let(:builder) do
    if defined?(ActionView::Helpers::Tags::Base)
      ActionView::Helpers::FormBuilder.new :user, user, template, {}
    else
      ActionView::Helpers::FormBuilder.new :user, user, template, {}, Proc.new {}
    end
  end

  let(:select_tag) do
    <<-EOS.chomp.strip
      <select id="user_language" name="user[language]">
    EOS
  end

  it 'selects the value of language' do
    user.language = 'th'
    selected_option = options_for_select [%w(Thai th)], 'th'
    language_select = builder.language_select :language

    expect(language_select).to include(selected_option)
  end

  it 'uses the locale specified by I18n.locale' do
    selected_option = options_for_select([%w(ไทย th)], 'th').force_encoding('UTF-8')
    user.language = 'th'
    original_locale = I18n.locale

    begin
      I18n.locale = :th
      language_select = builder.language_select(:language).force_encoding('UTF-8')

      expect(language_select).to include(selected_option)
    ensure
      I18n.locale = original_locale
    end
  end

  it 'uses a locale option' do
    user.language = 'th'
    selected_option = options_for_select([%w(タイ語 th)], 'th').force_encoding('UTF-8')
    language_select = builder.language_select(:language, locale: :ja).force_encoding('UTF-8')

    expect(language_select).to include(selected_option)
  end

  it 'uses an only option' do
    user.language = 'th'
    language_select_1 = builder.select :language, [%w(English en), %w(Japanese ja)]
    language_select_2 = builder.language_select :language, only: %w(en ja)

    expect(language_select_2).to eql(language_select_1)
  end

  it 'uses an except option' do
    user.language = 'th'
    selected_option = options_for_select [%w(Thai th)]
    language_select = builder.language_select :language, except: ['th']

    expect(language_select).to_not include(selected_option)
  end
end
