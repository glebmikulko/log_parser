# frozen_string_literal: true

class PageViewsPresenter < ConsoleStatCollectorPresenter
  def present
    stat_collector.statistics.each do |record|
      p "#{record.page} #{record.views} visits"
    end

    print_delimeter
  end
end
