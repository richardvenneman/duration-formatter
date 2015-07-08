require 'ruby-duration'

class FormattedDuration
  WEEKS_FORMAT = '%w %~w'
  DAYS_FORMAT = '%d %~d'
  HOURS_FORMAT = '%h %~h'
  MINUTES_FORMAT = '%m %~m'

  def initialize(minutes)
    @minutes = minutes % 60
    @hours = minutes / 60
    @days = @hours / 24
    @weeks = @days / 7
  end

  def format
    weekless_days = @days % 7
    dayless_hours = @hours % 24
    output = []

    output << Duration.new(weeks: @weeks).format(WEEKS_FORMAT) if @weeks != 0
    output << Duration.new(days: weekless_days).format(DAYS_FORMAT) if weekless_days != 0
    output << Duration.new(hours: dayless_hours).format(HOURS_FORMAT) if dayless_hours != 0
    output << Duration.new(minutes: @minutes).format(MINUTES_FORMAT) if @minutes != 0

    output.join(', ')
  end
end
