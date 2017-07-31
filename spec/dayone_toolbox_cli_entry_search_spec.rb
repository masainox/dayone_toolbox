require 'spec_helper'

RSpec.describe DayoneToolbox::CLI::Entry do


  describe '#search' do
    context 'valid entry file 01' do
      context 'valid uuid' do
        let(:options) { {'uuid' => 'DD950ADE4D9B4FFD88748FF825D50C99'} }

        subject do
          DayoneToolbox::CLI::Entry.new.invoke(:search, [valid_entry_file_01], options)
        end

        it {expect(subject.class).to eq DayoneToolbox::CLI::Entry }
        it {expect(subject.api.class).to eq DayoneToolbox::API::SearchEntry }
        it {expect(subject.api.result).to be true }
      end

      context 'valid starred' do
        let(:options) { {'starred' => true} }

        subject do
          DayoneToolbox::CLI::Entry.new.invoke(:search, [valid_entry_file_01], options)
        end

        it {expect(subject.class).to eq DayoneToolbox::CLI::Entry }
        it {expect(subject.api.class).to eq DayoneToolbox::API::SearchEntry }
        it {expect(subject.api.result).to be true }
      end
    end


    context 'valid entry file 03' do
      context 'valid options {tags = []}' do
        let(:options) { {'tags' => []} }

        subject do
          DayoneToolbox::CLI::Entry.new.invoke(:search, [valid_entry_file_03], options)
        end

        it {expect(subject.class).to eq DayoneToolbox::CLI::Entry }
        it {expect(subject.api.class).to eq DayoneToolbox::API::SearchEntry }
        it {expect(subject.api.result).to be true }
      end

      context "invalid options {tags = ['']}" do
        let(:options) { {'tags' => ['']} }

        subject do
          DayoneToolbox::CLI::Entry.new.invoke(:search, [valid_entry_file_03], options)
        end

        it {expect(subject.class).to eq DayoneToolbox::CLI::Entry }
        it {expect(subject.api.class).to eq DayoneToolbox::API::SearchEntry }
        it {expect(subject.api.result).to be false }
      end

      context "valid options {tags = nil}" do
        let(:options) { {'tags' => nil} }

        subject do
          DayoneToolbox::CLI::Entry.new.invoke(:search, [valid_entry_file_03], options)
        end

        it {expect(subject.class).to eq DayoneToolbox::CLI::Entry }
        it {expect(subject.api.class).to eq DayoneToolbox::API::SearchEntry }
        it {expect(subject.api.result).to be true }
      end

    end
  end


  describe '#search_options' do
    describe 'valid' do
      context 'valid params {tags => nil}' do
        let(:options) { {'tags' => nil} }

        subject do
          cli = DayoneToolbox::CLI::Entry.new.invoke(:search, [valid_entry_file_03], options)
          cli.options
          cli.send(:search_options)
        end

        it {expect(subject['tags']).to eq [] }

      end
    end
  end

end
