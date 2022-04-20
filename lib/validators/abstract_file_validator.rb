# frozen_string_literal: true

module Validators
  class AbstractFileValidator
    def initialize(filename)
      @filename = filename
    end

    def validate!
      return if valid?

      raise ::FileError, fail_message
    end

    def valid?
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def fail_message
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    private

    attr_reader :filename
  end
end
