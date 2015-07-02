# Coverage
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start if ENV['CODECLIMATE_REPO_TOKEN']

# Source files
require './lib/formatted_duration'

# Support
require 'minitest/autorun'
require 'minitest/pride'
