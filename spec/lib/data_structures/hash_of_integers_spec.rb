# frozen_string_literal: true

describe HashOfIntegers do
  describe '#statistics_list' do
    let(:page_stat_class) { class_spy(PageStat) }
    subject { HashOfIntegers.new(page_stat_class) }
    let(:log_entry) { instance_double(LogEntry) }

    before do
      allow(log_entry).to receive(:page).and_return('/test')
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
        expect(page_stat_class).to have_received(:new).with('/test', 5)
      end
    end
  end
end
