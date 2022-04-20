# frozen_string_literal: true

class StatCollector
  def initialize(data_structure)
    @data_structure = data_structure
  end

  def register_log_entry(log_entry)
    data_structure.add(log_entry)
  end

  def statistics
    data_structure.statistics_list
  end

  private

  attr_reader :data_structure
end
