# frozen_string_literal: true

describe PageUniqViewsPresenter do
  describe '#present' do
    let(:stat_collector) { instance_double(StatCollector) }
    let(:page_stat) { instance_double(PageStat) }
    subject { PageUniqViewsPresenter.new(stat_collector) }

    before do
      allow(page_stat).to receive(:page).and_return('/test')
      allow(page_stat).to receive(:views).and_return('5')
      allow(stat_collector).to receive(:statistics).and_return([page_stat])
    end

    context 'give statistics collector' do
      it 'prints statistics to stdout' do
        expected = "\"/test 5 unique views\"\n\"------------------------------\"\n"
        expect { subject.present }.to output(expected).to_stdout
      end
    end
  end
end
