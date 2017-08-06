require 'spec_helper'

RSpec.describe DayoneToolbox::Journal do

  describe '.new' do
    context 'valid params' do
      got_entries_path = File.join(valid_journal_file_01, 'entries/')
      got_photos_path = File.join(valid_journal_file_01, 'photos/')

      subject do
        DayoneToolbox::Journal.new(valid_journal_file_01)
      end

      it { expect(subject.entries_path).to eq got_entries_path }
      it { expect(subject.photos_path).to eq got_photos_path }
    end
  end


  describe '#entries' do
    context 'valid params' do
      subject do
        DayoneToolbox::Journal.new(valid_journal_file_01).entries
      end

      it { expect(subject.class).to be Array }
      it { expect(subject.size).to eq 4 }
      it { expect(subject[0]).to eq File.join(valid_journal_file_01, 'entries/subdir/valid_04.doentry') }
      it { expect(subject[1]).to eq File.join(valid_journal_file_01, 'entries/valid_01.doentry') }
      it { expect(subject[2]).to eq File.join(valid_journal_file_01, 'entries/valid_02.doentry') }
      it { expect(subject[3]).to eq File.join(valid_journal_file_01, 'entries/valid_03_no_tags.doentry') }
    end
  end


  describe '#photos' do
    context 'valid params' do
      before do
        @photos = DayoneToolbox::Journal.new(valid_journal_file_02).photos
      end

      it { expect(@photos.class).to be Array }
      it { expect(@photos.size).to eq 2 }
      it { expect(@photos[0]).to eq File.join(valid_journal_file_02, 'photos/34B99269E5AB4613A3F4D827A2A466EE.jpg') }
    end
  end

end
