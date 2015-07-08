require 'test_helper'

class FormattedDurationTest < Minitest::Test

  # Full units

  def test_weeks_only_duration
    text = '1 week'
    output = FormattedDuration.new(10080).format

    assert_equal text, output
  end

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

  # Composition

  def test_weeks_and_days_duration
    text = '1 week, 4 days'
    output = FormattedDuration.new(15840).format

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

  # Constraints

  def test_days_constraint
    text = '8 days'
    output = FormattedDuration.new(11520, :days).format

    assert_equal text, output
  end

  def test_hours_constraint
    text = '24 hours'
    output = FormattedDuration.new(1440, :hours).format

    assert_equal text, output
  end

  def test_minutes_constraint
    text = '80 minutes'
    output = FormattedDuration.new(80, :minutes).format

    assert_equal text, output
  end
end
