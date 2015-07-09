require 'ruby-duration'

class FormattedDuration
  CONSTRAINTS = [:minutes, :hours, :days, :weeks]
  FORMATS = { weeks: '%w %~w', days: '%tdu', hours: '%thu', minutes: '%tmu' }
  BARE_FORMATS = { days: '%d %~d', hours: '%h %~h', minutes: '%m %~m' }
  BARE = { days: 7, hours: 24, minutes: 60 }

  def initialize(minutes, constraint = :weeks)
    @constraint = CONSTRAINTS.index(constraint)
    @minutes = minutes
    @hours = minutes / 60
    @days = @hours / 24
    @weeks = @days / 7
    @output = []
  end

  def format
    append(:weeks, @weeks, '%w %~w') if @weeks > 0 && @constraint > 2
    add(:days, @days, 2)
    add(:hours, @hours, 1)
    add(:minutes, @minutes, 0)

    @output.join(', ')
  end

  def append(unit, value, format)
    opts = {}
    opts[unit] = value

    @output << Duration.new(opts).format(format)
  end

  def add(unit, value, constraint)
    bare = value % BARE[unit]

    if value > 0 && @constraint == constraint
      append(unit, value, FORMATS[unit])
    elsif bare > 0 && @constraint > constraint - 1
      append(unit, bare, BARE_FORMATS[unit])
    end
  end
end
