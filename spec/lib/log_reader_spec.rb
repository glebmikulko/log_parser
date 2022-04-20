# frozen_string_literal: true

describe LogReader do
  describe '#enumerator' do
    let(:validator) { instance_double(Validators::AbstractFileValidator) }
    let(:validator_class) { class_double(Validators::AbstractFileValidator) }
    subject { LogReader.new('test.log', [validator_class]) }
    let(:file_like_object) { spy('file like object') }

    before do
      allow(validator).to receive(:validate!).and_return(true)
      allow(validator_class).to receive(:new).and_return(validator)
      allow(File).to receive(:open).with('test.log', 'r').and_return(file_like_object)
    end

    it 'invokes #each on file' do
      subject.enumerator
      expect(file_like_object).to have_received(:each)
    end
  end
end
