# frozen_string_literal: true

module Validators
  class LogEntryValidator
    # :reek:NilCheck
    def validate!(log_entry)
      page = log_entry.page
      ip = log_entry.ip

      page_exists = !page.nil? && !page.strip.empty?
      ip_exists = !ip.nil? && !ip.strip.empty?
      return if page_exists && ip_exists

      raise DataCorruptionError, 'A line in the log is corrupted'
    end
  end
end
