# frozen_string_literal: true

require_relative 'abstract_file_validator'

module Validators
  class FileReadable < AbstractFileValidator
    def valid?
      File.readable?(filename)
    end

    def fail_message
      'File is not readable'
    end
  end
end
