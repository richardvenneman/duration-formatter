require 'test_helper'

class FormattedDurationTest < Minitest::Test
  def test_days_only_duration
    text = '1 day'
    output = FormattedDuration.new(1440).format

    assert_equal text, output
  end

  def test_hours_only_duration
    text = '1 hour'
    output = FormattedDuration.new(60).format

    assert_equal text, output
  end

  def test_minutes_only_duration
    text = '30 minutes'
    output = FormattedDuration.new(30).format

    assert_equal text, output
  end

  def test_days_and_hours_duration
    text = '1 day, 4 hours'
    output = FormattedDuration.new(1680).format

    assert_equal text, output
  end

  def test_hours_and_minutes_duration
    text = '1 hour, 30 minutes'
    output = FormattedDuration.new(90).format

    assert_equal text, output
  end
end
