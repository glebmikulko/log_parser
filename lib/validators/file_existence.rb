# frozen_string_literal: true

require_relative 'abstract_file_validator'

module Validators
  class FileExistence < AbstractFileValidator
    def valid?
      File.file?(filename)
    end

    def fail_message
      "File doesn't exist"
    end
  end
end
