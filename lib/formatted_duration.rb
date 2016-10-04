require 'ruby-duration'

class FormattedDuration
  CONSTRAINTS = [:minutes, :hours, :days, :weeks].freeze
  FORMATS = { weeks: '%w %~w', days: '%tdu', hours: '%thu', minutes: '%tmu' }.freeze
  BARE_FORMATS = { days: '%d %~d', hours: '%h %~h', minutes: '%m %~m' }.freeze
  BARE = { days: 7, hours: 24, minutes: 60 }.freeze

  def initialize(minutes, constraint = :weeks)
    @constraint = CONSTRAINTS.index(constraint)
    @minutes = minutes
    @hours = minutes / 60
    @days = @hours / 24
    @weeks = @days / 7
    @output = []
  end

  def format
    append(:weeks, @weeks, '%w %~w') if @weeks.positive? && @constraint > 2
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

    if value.positive? && @constraint == constraint
      append(unit, value, FORMATS[unit])
    elsif bare.positive? && @constraint > constraint - 1
      append(unit, bare, BARE_FORMATS[unit])
    end
  end
end
