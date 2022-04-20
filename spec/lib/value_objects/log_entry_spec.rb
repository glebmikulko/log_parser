# frozen_string_literal: true

describe LogEntry do
  describe '.build' do
    context 'given a log line' do
      it 'splits line and creates object' do
        log_entry = LogEntry.build('/test 1.1.1.1')
        expect(log_entry.page).to eq('/test')
        expect(log_entry.ip).to eq('1.1.1.1')
      end
    end
  end
end
