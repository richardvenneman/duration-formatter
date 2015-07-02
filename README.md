#duration-formatter

A simple gem to parse minutes into a readable format using [ruby-duration](https://github.com/peleteiro/ruby-duration).

[![Gem Version](https://badge.fury.io/rb/duration-formatter.svg)](http://badge.fury.io/rb/duration-formatter) [![Code Climate](https://codeclimate.com/github/richardvenneman/duration-formatter/badges/gpa.svg)](https://codeclimate.com/github/richardvenneman/duration-formatter) [![Dependency Status](https://gemnasium.com/richardvenneman/duration-formatter.svg)](https://gemnasium.com/richardvenneman/duration-formatter) [![Test Coverage](https://codeclimate.com/github/richardvenneman/duration-formatter/badges/coverage.svg)](https://codeclimate.com/github/richardvenneman/duration-formatter/coverage) [![Build Status](http://img.shields.io/travis/richardvenneman/duration-formatter.svg)](https://travis-ci.org/richardvenneman/duration-formatter)

## Installation

Add it to your Gemfile with:

```ruby
gem 'duration-formatter'
```

Run the `bundle install` in your terminal command to install it.

## Usage

The gem exposes a class `FormattedDuration` which takes the passed minutes to determine the format. Calling `format` on the instance  returns the formatted duration. Examples:

```ruby
# Full days, hours and minutes
FormattedDuration.new(1440).format # => 1 day
FormattedDuration.new(240).format # => 4 hours
FormattedDuration.new(20).format # => 20 minutes

# Composition
FormattedDuration.new(1450).format # => 1 day, 10 minutes
FormattedDuration.new(241).format # => 4 hours, 1 minute
```

## TODO

This gem is a work-in-progress. Planned features:

1. Seconds support
2. Support “half” units, e.g. 90 minutes becomes 1½ hours

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- Report bugs
- Fix bugs and submit pull requests
- Write, clarify, or fix documentation
- Suggest or add new features
- Write missing tests
