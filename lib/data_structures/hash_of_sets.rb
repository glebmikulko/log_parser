# frozen_string_literal: true

require 'set'

class HashOfSets < AbstractStructure
  def initialize(page_stat_class = PageStat)
    @hash = Hash.new { |h, k| h[k] = Set.new }
    @page_stat_class = page_stat_class
  end

  def add(log_entry)
    hash[log_entry.page].add(log_entry.ip)
  end

  def statistics_list
    sorted_hash = hash.transform_values(&:count).sort_by { |_page, visits| -visits }
    sorted_hash.map { |page, visits| page_stat_class.new(page, visits) }
  end

  private

  attr_reader :hash, :page_stat_class
end
