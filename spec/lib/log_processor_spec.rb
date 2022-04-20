# frozen_string_literal: true

describe LogProcessor do
  describe '#process' do
    let(:log_reader) { instance_double(LogReader) }
    let(:record_class) { class_spy(LogEntry) }
    let(:stat_collector) { instance_spy(StatCollector) }
    let(:record_validator) { instance_spy(Validators::LogEntryValidator) }
    let(:processor) do
      LogProcessor.new(log_reader:, stat_collectors: [stat_collector],
                       record_class:, record_validator:)
    end

    before do
      allow(log_reader).to receive(:enumerator).and_return(['file line'].each)
      processor.process
    end

    it 'calls reader to parse file' do
      expect(log_reader).to have_received(:enumerator)
    end

    it 'builds log entry object' do
      expect(record_class).to have_received(:build).with('file line')
    end

    it 'validates created object' do
      expect(record_validator).to have_received(:validate!).once
    end

    it 'stores log object in collector' do
      expect(stat_collector).to have_received(:register_log_entry).once
    end
  end
end
