require './lib/duration_formatter/version'

Gem::Specification.new do |s|
  s.name        = 'duration-formatter'
  s.version     = DurationFormatter::VERSION
  s.authors     = ["Richard Venneman"]
  s.email       = 'richardvenneman@me.com'
  s.homepage    =
    'https://github.com/richardvenneman/duration-formatter'
  s.summary     = 'Formatter for ruby-duration'
  s.description = 'A simple gem to parse minutes into a readable format using
                   ruby-duration.'

  s.license     = 'MIT'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = Dir['test/**/*']

  s.add_dependency 'ruby-duration', '~> 3.2'

  s.add_development_dependency 'guard', '~> 2.12'
  s.add_development_dependency 'guard-minitest', '~> 2.4'
  s.add_development_dependency 'rb-fsevent', '~> 0.9'
end
