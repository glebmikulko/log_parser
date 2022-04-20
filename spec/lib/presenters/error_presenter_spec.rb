# frozen_string_literal: true

describe ErrorPresenter do
  describe '#present' do
    let(:error) { instance_double(StandardError) }
    subject { ErrorPresenter.new(error) }

    before do
      allow(error).to receive(:message).and_return('failed')
    end

    context 'given an error' do
      it 'prints its message to stdout' do
        expect { subject.present }.to output("\"Error: failed.\"\n").to_stdout
      end
    end
  end
end
