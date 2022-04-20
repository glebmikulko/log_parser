# frozen_string_literal: true

describe Validators::FileNotEmpty do
  describe '#validate!' do
    subject { Validators::FileNotEmpty.new('test.log') }

    context 'when file is empty' do
      before do
        allow(File).to receive(:zero?).and_return(true)
      end

      it 'raises error of appropriate class' do
        expect { subject.validate! }.to raise_error(FileError)
      end
    end
  end
end
