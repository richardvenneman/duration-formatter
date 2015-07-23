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
# Full units
FormattedDuration.new(10080).format # => 1 week
FormattedDuration.new(1440).format # => 1 day
FormattedDuration.new(240).format # => 4 hours
FormattedDuration.new(20).format # => 20 minutes

# Composition
FormattedDuration.new(15840).format # => 1 week, 4 days
FormattedDuration.new(1450).format # => 1 day, 10 minutes
FormattedDuration.new(241).format # => 4 hours, 1 minute
```

### Constraints

You can also force a constraint upon the format.

```ruby
FormattedDuration.new(11520, :days).format # => 15 days (not "2 weeks, 1 day")
FormattedDuration.new(1440, :hours).format # => 24 hours
FormattedDuration.new(80, :minutes).format # => 80 minutes
```

## License

This library is released under the [MIT License](http://www.opensource.org/licenses/MIT).
