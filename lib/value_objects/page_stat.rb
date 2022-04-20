# frozen_string_literal: true

class PageStat
  attr_reader :page, :views

  def initialize(page, views)
    @page = page
    @views = views
  end
end
