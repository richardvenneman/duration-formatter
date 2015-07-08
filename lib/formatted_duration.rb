require 'ruby-duration'

class FormattedDuration
  CONSTRAINTS = [:minutes, :hours, :days, :weeks]

  def initialize(minutes, constraint = :weeks)
    @constraint = CONSTRAINTS.index(constraint)

    @minutes = minutes
    @hours = minutes / 60
    @days = @hours / 24
    @weeks = @days / 7
  end

  def format
    weekless_days = @days % 7
    dayless_hours = @hours % 24
    hourless_minutes = @minutes % 60
    output = []

    if @weeks != 0 && @constraint > 2
      output << Duration.new(weeks: @weeks).format('%w %~w')
    end

    if weekless_days != 0 && @constraint > 1
      output << Duration.new(days: weekless_days).format('%d %~d')
    elsif @days > 0 && @constraint == 2
      output << Duration.new(days: @days).format('%tdu')
    end

    if dayless_hours != 0 && @constraint > 0
      output << Duration.new(hours: dayless_hours).format('%h %~h')
    elsif @hours > 0 && @constraint == 1
      output << Duration.new(hours: @hours).format('%thu')
    end

    if hourless_minutes != 0
      output << Duration.new(minutes: hourless_minutes).format('%m %~m')
    elsif @minutes > 0 && @constraint == 0
      output << Duration.new(minutes: @minutes).format('%tmu')
    end

    output.join(', ')
  end
end
