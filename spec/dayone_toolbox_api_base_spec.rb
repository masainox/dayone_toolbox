require 'spec_helper'

RSpec.describe DayoneToolbox::API::Base do

  describe '.new' do
    context 'valid file 01' do
      subject {
        DayoneToolbox::API::Base.new(valid_entry_file_01)
      }

      it { expect(subject.entry.class).to eq DayoneToolbox::Entry }
      it { expect(subject.result).to be nil }

    end

    context 'valid_file_02' do
      subject {
        DayoneToolbox::API::Base.new(valid_entry_file_02)
      }

      it { expect(subject.entry.class).to eq DayoneToolbox::Entry }
      it { expect(subject.result).to be nil }

    end
  end


  describe '#store' do
    context 'valid file 01' do
      subject {
        DayoneToolbox::API::Base.new(valid_entry_file_01)
      }

      store_file = 'spec/tmp/api_base_store.doentry'
      it { expect(subject.store(store_file).class).to eq DayoneToolbox::API::Base ; FileUtils.rm(store_file)}
    end
  end

end
