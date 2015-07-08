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

    if @days > 0 && @constraint == 2
      output << Duration.new(days: @days).format('%tdu')
    elsif weekless_days != 0 && @constraint > 1
      output << Duration.new(days: weekless_days).format('%d %~d')
    end

    if @hours > 0 && @constraint == 1
      output << Duration.new(hours: @hours).format('%thu')
    elsif dayless_hours != 0 && @constraint > 0
      output << Duration.new(hours: dayless_hours).format('%h %~h')
    end

    if @minutes > 0 && @constraint == 0
      output << Duration.new(minutes: @minutes).format('%tmu')
    elsif hourless_minutes != 0
      output << Duration.new(minutes: hourless_minutes).format('%m %~m')
    end

    output.join(', ')
  end
end
