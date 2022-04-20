# frozen_string_literal: true

describe Validators::FileExistence do
  describe '#validate!' do
    subject { Validators::FileExistence.new('test.log') }

    context 'when file is absent' do
      before do
        allow(File).to receive(:file?).and_return(false)
      end

      it 'raises error of appropriate class' do
        expect { subject.validate! }.to raise_error(FileError)
      end
    end
  end
end
