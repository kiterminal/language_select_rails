require 'i18n_data'
require 'language_select_rails/version'
require 'language_select_rails/tag_helper'

if defined?(ActionView::Helpers::Tags::Base)
  require 'language_select_rails/language_select_rails_helper'
else
  require 'language_select_rails/rails3/language_select_rails_helper'
end
