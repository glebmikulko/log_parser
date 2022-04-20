# frozen_string_literal: true

describe StatCollector do
  let(:data_structure) { instance_spy(AbstractStructure) }
  let(:log_entry) { instance_double(LogEntry) }
  subject { StatCollector.new(data_structure) }

  describe '#register_log_entry' do
    it 'invokes #add on data structure' do
      subject.register_log_entry(log_entry)
      expect(data_structure).to have_received(:add).with(log_entry)
    end
  end

  describe '#statistics' do
    it 'invokes #statistics_list on data structure' do
      subject.statistics
      expect(data_structure).to have_received(:statistics_list)
    end
  end
end
