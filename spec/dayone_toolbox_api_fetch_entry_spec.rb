require 'spec_helper'

RSpec.describe DayoneToolbox::API::FetchEntry do

  describe '#exec' do
    context 'valid file 01 and valid params' do
      subject {
        DayoneToolbox::API::FetchEntry.new(valid_entry_file_01, {'uuid' => ''}).exec
      }

      it { expect(subject.class).to eq DayoneToolbox::API::FetchEntry }
      it { expect(subject.result.class).to eq Hash }
      it { expect(subject.result['uuid']).to eq 'DD950ADE4D9B4FFD88748FF825D50C99' }
      it { expect(subject.result['entry_text']).to be nil }
      it { expect(subject.result.size).to eq 1 }
    end
  end

end
