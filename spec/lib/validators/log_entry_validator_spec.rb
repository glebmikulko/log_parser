# frozen_string_literal: true

describe Validators::LogEntryValidator do
  describe '#validate!' do
    subject { Validators::LogEntryValidator.new }

    context 'log entry is not empty' do
      let(:log_entry) { instance_double(LogEntry) }

      before do
        allow(log_entry).to receive(:page).and_return('/test')
        allow(log_entry).to receive(:ip).and_return('1.1.1.1')
      end

      it 'does not raise error' do
        expect { subject.validate!(log_entry) }.not_to raise_error
      end
    end

    context 'log entry ip is empty' do
      let(:log_entry) { instance_double(LogEntry) }

      before do
        allow(log_entry).to receive(:page).and_return('/test')
        allow(log_entry).to receive(:ip).and_return('')
      end

      it 'does raise error of appropriate class' do
        expect { subject.validate!(log_entry) }.to raise_error(DataCorruptionError)
      end
    end

    context 'log entry page is nil' do
      let(:log_entry) { instance_double(LogEntry) }

      before do
        allow(log_entry).to receive(:page).and_return(nil)
        allow(log_entry).to receive(:ip).and_return('1.1.1.1')
      end

      it 'does raise error of appropriate class' do
        expect { subject.validate!(log_entry) }.to raise_error(DataCorruptionError)
      end
    end
  end
end
