# frozen_string_literal: true

describe Validators::FileReadable do
  describe '#validate!' do
    subject { Validators::FileReadable.new('test.log') }

    context 'when file is not readable' do
      before do
        allow(File).to receive(:readable?).and_return(false)
      end

      it 'raises error of appropriate class' do
        expect { subject.validate! }.to raise_error(FileError)
      end
    end
  end
end
