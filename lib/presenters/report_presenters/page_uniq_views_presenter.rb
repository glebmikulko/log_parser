# frozen_string_literal: true

class PageUniqViewsPresenter < ConsoleStatCollectorPresenter
  def present
    stat_collector.statistics.each do |record|
      p "#{record.page} #{record.views} unique views"
    end

    print_delimeter
  end
end
