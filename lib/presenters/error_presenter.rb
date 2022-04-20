# frozen_string_literal: true

class ErrorPresenter
  def initialize(error)
    @error = error
  end

  def present
    p "Error: #{error.message}."
  end

  private

  attr_reader :error
end
