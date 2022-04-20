# frozen_string_literal: true

class HashOfIntegers < AbstractStructure
  def initialize(page_stat_class = PageStat)
    @hash = Hash.new(0)
    @page_stat_class = page_stat_class
  end

  def add(log_entry)
    hash[log_entry.page] += 1
  end

  def statistics_list
    hash.sort_by { |_page, visits| -visits }.map { |page, visits| page_stat_class.new(page, visits) }
  end

  private

  attr_reader :hash, :page_stat_class
end
