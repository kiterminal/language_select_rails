# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'language_select_rails/version'

Gem::Specification.new do |spec|
  spec.name = 'language_select_rails'
  spec.version = LanguageSelectRails::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 1.9.3'
  spec.authors = ['Chainarin Thanichaiyawat']
  spec.email = ['kiterminal@gmail.com']
  spec.summary = 'Language Select Plugin for Rails'
  spec.description = <<-EOF
    Provides a HTML select of languages for Rails.
    The list comes from ISO 639-1 standard.
  EOF
  spec.homepage = 'https://github.com/kiterminal/language_select_rails'
  spec.license = 'MIT'

  spec.files = `git ls-files`.split($RS).reject do |file|
    file =~ %r{^(?:
    spec/.*
    |Gemfile
    |Rakefile
    |\.rspec
    |\.gitignore
    |\.rubocop.yml
    |\.rubocop_todo.yml
    |\.travis.yml
    |.*\.eps
    )$}x
  end
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = []
  spec.require_paths = ['lib']
  spec.metadata = {}

  spec.add_dependency 'i18n_data', '~> 0.7.0'
  spec.add_development_dependency 'actionpack', '~> 3'
  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'simplecov', '~> 0.10'
  spec.add_development_dependency 'coveralls', '~> 0.8'
end
