#!/usr/bin/env ruby
# frozen_string_literal: true

require 'require_all'
require_all 'lib'

filename = ARGV.first

most_uniq_viewed_stat = StatCollector.new(HashOfSets.new)
most_viewed_stat = StatCollector.new(HashOfIntegers.new)

stat_collectors = [most_viewed_stat, most_uniq_viewed_stat]

begin
  LogProcessor.new(stat_collectors:, log_reader: LogReader.new(filename)).process
rescue FileError, DataCorruptionError => e
  ErrorPresenter.new(e).present
  return
end

PageViewsPresenter.new(most_viewed_stat).present
PageUniqViewsPresenter.new(most_uniq_viewed_stat).present
