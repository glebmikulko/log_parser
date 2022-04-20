# frozen_string_literal: true

class LogEntry
  attr_reader :page, :ip

  private_class_method :new

  def initialize(page, ip)
    @page = page
    @ip = ip
  end

  def self.build(log_line)
    page, ip = log_line.split
    new(page, ip)
  end
end
