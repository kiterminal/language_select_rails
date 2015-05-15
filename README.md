[![Gem Version](https://badge.fury.io/rb/language_select_rails.svg)](http://badge.fury.io/rb/language_select_rails)
[![Dependency Status](https://gemnasium.com/kiterminal/language_select_rails.svg)](https://gemnasium.com/kiterminal/language_select_rails)
[![Build Status](https://travis-ci.org/kiterminal/language_select_rails.svg?branch=master)](https://travis-ci.org/kiterminal/language_select_rails)
[![Code Climate](https://codeclimate.com/github/kiterminal/language_select_rails/badges/gpa.svg)](https://codeclimate.com/github/kiterminal/language_select_rails)

# LanguageSelectRails

Provides a HTML select of languages for Rails. The list comes from [ISO 639 standard](https://en.wikipedia.org/wiki/ISO_639).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'language_select_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install language_select_rails

## Usage

Creates a language select tag

```ruby
language_select('user', 'language')
```

You can set a locale with `:locale` option

```ruby
language_select('user', 'language', locale: 'th')
```

You can set certain languages with `:only` option

```ruby
language_select('user', 'language', only: [:en, :zh, :ja, :th])
```

You can discard certain languages with `:except` option

```ruby
language_select('user', 'language', except: [:en, :zh, :ja, :th])
```

## Contributing

1. Fork it ( https://github.com/kiterminal/language_select_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2015 Chainarin Thanichaiyawat.
