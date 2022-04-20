# frozen_string_literal: true

describe 'End to end flow' do
  let(:expected_output) { fixture('expected_output.txt') }
  it 'prints statistics to stdout' do
    filename = 'spec/fixtures/input.log'

    most_uniq_viewed_stat = StatCollector.new(HashOfSets.new)
    most_viewed_stat = StatCollector.new(HashOfIntegers.new)

    stat_collectors = [most_viewed_stat, most_uniq_viewed_stat]

    LogProcessor.new(stat_collectors:, log_reader: LogReader.new(filename)).process

    expect do
      PageViewsPresenter.new(most_viewed_stat).present
      PageUniqViewsPresenter.new(most_uniq_viewed_stat).present
    end.to output(expected_output.read).to_stdout
  end
end
