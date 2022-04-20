# frozen_string_literal: true

require_relative 'validators/file_existence'
require_relative 'validators/file_not_empty'
require_relative 'validators/file_readable'

class LogReader
  DEFAULT_FILE_VALIDATORS = [Validators::FileExistence, Validators::FileNotEmpty, Validators::FileReadable].freeze

  def initialize(filename, validator_classes = DEFAULT_FILE_VALIDATORS)
    @filename = filename
    @validators = validator_classes.map { |validator| validator.new(@filename) }
  end

  def enumerator
    validate!
    File.open(filename, 'r').each
  end

  private

  attr_reader :filename, :validators

  def validate!
    validators.each(&:validate!)
  end
end
