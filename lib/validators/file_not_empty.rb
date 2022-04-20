# frozen_string_literal: true

require_relative 'abstract_file_validator'

module Validators
  class FileNotEmpty < AbstractFileValidator
    def valid?
      !File.zero?(filename)
    end

    def fail_message
      'File is empty'
    end
  end
end
