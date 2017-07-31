require 'spec_helper'

RSpec.describe DayoneToolbox::Entry do

  describe '.new' do
    context 'valid file and valid params' do
      subject do
        DayoneToolbox::Entry.new(valid_entry_file_01)
      end

      it { expect(subject.file).to eq  valid_entry_file_01 }
      it { expect(subject.creation_date.class).to eq DateTime }
      it { expect(subject.creation_date?).to eq true }

      it { expect(subject.creator.class).to eq Hash }
      it { expect(subject.creator?).to be true }

      it { expect(subject.entry_text).to eq  'This is valid file 01.' }
      it { expect(subject.entry_text?).to be true }

      it { expect(subject.starred).to be true }
      it { expect(subject.starred?).to be true }

      it { expect(subject.tags.size).to eq 1 }
      it { expect(subject.tags[0]).to eq 'test' }
      it { expect(subject.tags?).to be true }

      it { expect(subject.time_zone).to eq 'Asia/Tokyo' }
      it { expect(subject.time_zone?).to be true }

      it { expect(subject.uuid).to eq  'DD950ADE4D9B4FFD88748FF825D50C99' }
      it { expect(subject.uuid?).to be true }

      it { expect(subject.location).to be nil }
      it { expect(subject.location?).to be false }

      it { expect(subject.weather).to be nil }
      it { expect(subject.weather?).to be false }
    end
  end


  describe 'attr_accessor' do
    context 'valid file and valid params' do
      time = DateTime.now
      let(:setter_creation_date) { time }
      let(:setter_creator) { {} }
      let(:setter_entry_text) { 'This is setter text' }
      let(:setter_starred) { false }
      let(:setter_tags) { ['tag1', 'tag2', 'tag3']  }
      let(:setter_time_zone) { 'Asia/Osaka' }
      let(:setter_uuid) { 'MYUUID'  }

      subject do
        entry = DayoneToolbox::Entry.new(valid_entry_file_01)
        entry.creation_date = setter_creation_date
        entry.entry_text = setter_entry_text
        entry.starred = setter_starred
        entry.tags = setter_tags
        entry.time_zone = setter_time_zone
        entry.uuid = setter_uuid
        entry
      end

      it { expect(subject.file).to eq  valid_entry_file_01 }
      it { expect(subject.creation_date.class).to eq DateTime }
      it { expect(subject.creator.class).to eq Hash }
      it { expect(subject.entry_text).to eq setter_entry_text }
      it { expect(subject.starred).to be setter_starred }
      it { expect(subject.tags.size).to eq 3 }
      it { expect(subject.tags[0]).to eq 'tag1' }
      it { expect(subject.time_zone).to eq setter_time_zone }
      it { expect(subject.uuid).to eq setter_uuid }
      it { expect(subject.location).to be nil }
      it { expect(subject.weather).to be nil }
    end
  end


  describe '.to_h' do
    context 'valid file and valid params' do
      subject do
        DayoneToolbox::Entry.new(valid_entry_file_01).to_h
      end

      it { expect(subject.class).to eq Hash }
      it { expect(subject['Creation Date'].class).to eq DateTime }
      it { expect(subject['Creator'].class).to eq Hash }
      it { expect(subject['Entry Text']).to eq 'This is valid file 01.' }
      it { expect(subject['Starred']).to be true }
      it { expect(subject['Tags'].size).to eq 1 }
      it { expect(subject['Tags'][0]).to eq 'test' }
      it { expect(subject['Time Zone']).to eq 'Asia/Tokyo' }
      it { expect(subject['UUID']).to eq 'DD950ADE4D9B4FFD88748FF825D50C99' }
      it { expect(subject['Location']).to be nil }
      it { expect(subject['Weather']).to be nil }
    end
  end


  describe '.to_plist' do
    context 'valid file and valid params' do
      let(:got_plist) { File.open(valid_entry_file_01).read }
      subject do
        DayoneToolbox::Entry.new(valid_entry_file_01).to_plist
      end

      it { expect(subject.class).to eq String }
      it { expect(subject).to eq(got_plist) }
    end
  end


  describe '.custom_key' do
    context 'valid file and valid params' do
      before do
        @entry = DayoneToolbox::Entry.new(valid_entry_file_05)
      end

      it { expect(@entry.custom_key('')).to eq nil }
      it { expect(@entry.custom_key('CustomKey')).to eq nil }
      it { expect(@entry.custom_key('CustomKey1')).to eq 'custom key string' }
    end
  end


  describe '.custom_key?' do
    context 'valid file and valid params' do
      before do
        @entry = DayoneToolbox::Entry.new(valid_entry_file_05)
      end

      it { expect(@entry.custom_key?('CustomKey')).to be false }
      it { expect(@entry.custom_key?('CustomKey1')).to be true }
    end
  end


  describe '.custom_key=' do
    context 'valid file and valid params' do
      before do
        @entry = DayoneToolbox::Entry.new(valid_entry_file_05)
        @set_key = 'CustomKey2'
        @set_value = 'custom value 02'
        @target = @entry.set_custom_key(@set_key, @set_value)
      end

      it { expect(@target).to eq @set_value }
      it { expect(@entry.custom_key('CustomKey')).to eq nil }
      it { expect(@entry.custom_key('CustomKey1')).to eq 'custom key string' }
      it { expect(@entry.custom_key(@set_key)).to eq @set_value }
    end
  end


end
