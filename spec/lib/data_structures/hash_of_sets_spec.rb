# frozen_string_literal: true

describe HashOfSets do
  describe '#statistics_list' do
    let(:page_stat_class) { class_spy(PageStat) }
    subject { HashOfSets.new(page_stat_class) }
    let(:log_entry) { instance_double(LogEntry) }
    let(:log_entry2) { instance_double(LogEntry) }

    before do
      allow(log_entry).to receive(:page).and_return('/test')
      allow(log_entry).to receive(:ip).and_return('111.111.111.111')

      allow(log_entry2).to receive(:page).and_return('/test')
      allow(log_entry2).to receive(:ip).and_return('222.222.222.222')
    end

    context 'for one log entry' do
      it 'returns one item array' do
        subject.add(log_entry)
        expect(subject.statistics_list.size).to eq(1)
        expect(page_stat_class).to have_received(:new).with('/test', 1)
      end
    end

    context 'for multiple identical log entries' do
      it 'returns one item array with proper statistics' do
        5.times { subject.add(log_entry) }
        expect(subject.statistics_list.size).to eq(1)
        expect(page_stat_class).to have_received(:new).with('/test', 1)
      end
    end

    context 'for two different ip for one page' do
      it 'returns one item array with proper statistics' do
        [log_entry, log_entry2].each { subject.add(_1) }
        expect(subject.statistics_list.size).to eq(1)
        expect(page_stat_class).to have_received(:new).with('/test', 2)
      end
    end
  end
end
