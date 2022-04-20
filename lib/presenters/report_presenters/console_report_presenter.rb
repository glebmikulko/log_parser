# frozen_string_literal: true

class ConsoleStatCollectorPresenter
  DELIMETER = '-'
  DELIMETER_LENGTH = 30

  def initialize(stat_collector)
    @stat_collector = stat_collector
  end

  def present
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def print_delimeter
    p DELIMETER * DELIMETER_LENGTH
  end

  private

  attr_reader :stat_collector
end
