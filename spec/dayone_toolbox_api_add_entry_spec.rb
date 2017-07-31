require 'spec_helper'

RSpec.describe DayoneToolbox::API::AddEntry do

  describe '#exec' do
    context 'valid file 01 and valid params' do
      let(:options) { {'tags' => ['add_tag1', 'add_tag2'], 'entry_text' => 'Add Entry Text' } }
      let(:got_tags) { ['test', 'add_tag1', 'add_tag2'] }
      let(:got_entry_text) { 'This is valid file 01.Add Entry Text' }

      subject {
        DayoneToolbox::API::AddEntry.new(valid_entry_file_01, options).exec
      }

      it { expect(subject.class).to eq DayoneToolbox::API::AddEntry }
      it { expect(subject.result.class).to eq Hash }

      it { expect(subject.entry.tags).to eq got_tags }
      it { expect(subject.result['tags']).to eq got_tags }

      it { expect(subject.entry.entry_text).to eq got_entry_text }
      it { expect(subject.result['entry_text']).to eq got_entry_text }
    end
  end

end
