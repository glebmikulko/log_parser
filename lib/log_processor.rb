# frozen_string_literal: true

class LogProcessor
  def initialize(log_reader:, stat_collectors:, record_class: LogEntry,
                 record_validator: Validators::LogEntryValidator.new)
    @record_class = record_class
    @stat_collectors = stat_collectors
    @log_reader = log_reader
    @record_validator = record_validator
  end

  def process
    log_reader.enumerator.each { process_log_line(_1) }
  end

  private

  attr_reader :record_class, :stat_collectors, :log_reader, :record_validator

  def process_log_line(line)
    log_record = record_class.build(line)
    stat_collectors.each do |collector|
      record_validator.validate!(log_record)
      collector.register_log_entry(log_record)
    end
  end
end
