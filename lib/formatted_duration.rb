require 'ruby-duration'

class FormattedDuration
  DAYS_FORMAT = '%d %~d'
  HOURS_FORMAT = '%h %~h'
  MINUTES_FORMAT = '%m %~m'

  def initialize(minutes)
    @minutes = minutes % 60
    @hours = minutes / 60
    @days = @hours / 24
  end

  def format
    dayless_hours = @hours % 24
    output = []

    output << Duration.new(days: @days).format(DAYS_FORMAT) if @days != 0
    output << Duration.new(hours: dayless_hours).format(HOURS_FORMAT) if dayless_hours != 0
    output << Duration.new(minutes: @minutes).format(MINUTES_FORMAT) if @minutes != 0

    output.join(', ')
  end
end
