require './lib/duration_formatter/version'

Gem::Specification.new do |s|
  s.name        = 'duration-formatter'
  s.version     = DurationFormatter::VERSION
  s.license     = 'MIT'
  s.authors     = ['Richard Venneman']
  s.email       = 'richardvenneman@me.com'
  s.homepage    =
    'https://github.com/richardvenneman/duration-formatter'
  s.summary     = 'Formatter for ruby-duration'
  s.description = 'A simple gem to parse minutes into a readable format using
                   ruby-duration.'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = Dir['test/**/*']

  s.add_dependency 'ruby-duration', '~> 3.2'

  s.add_development_dependency 'rake', '~> 11.1'
  s.add_development_dependency 'guard', '~> 2.13'
  s.add_development_dependency 'guard-minitest', '~> 2.4'
  s.add_development_dependency 'simplecov', '~> 0.9'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
end
