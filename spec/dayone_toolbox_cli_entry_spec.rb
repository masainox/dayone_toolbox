require 'spec_helper'

RSpec.describe DayoneToolbox::CLI::Entry do


  describe '.exit_on_failure?' do
    context 'valid file' do
      it do
        expect(DayoneToolbox::CLI::Entry.exit_on_failure?).to be true
      end
    end
  end


  describe '#fetch' do
    context 'valid file' do
      subject {
        options = {'tags' => ''}
        cli = DayoneToolbox::CLI::Entry.new.invoke(:fetch, [valid_entry_file_01], options)
      }

      it '' do
        expect(subject.api.class).to eq DayoneToolbox::API::FetchEntry
      end
    end
  end


  describe '#edit' do
    context 'valid entry file' do
      before :each do
        @copied_file = 'spec/tmp/cli_entry_edit.doentry'
        @options = {'tags' => ['tag1', 'tag2']}
        FileUtils.cp(valid_entry_file_01, @copied_file)

        DayoneToolbox::CLI::Entry.new.invoke(:edit, [@copied_file], @options)
        @copied_entry = DayoneToolbox::Entry.new(@copied_file)
      end

      after :each do
        FileUtils.rm(@copied_file)
      end


      it '' do
      end

      it '' do
        expect(@copied_entry.class).to eq DayoneToolbox::Entry
      end

      it '' do
        expect(@copied_entry.tags.size).to eq 2
      end

      it '' do
        expect(@copied_entry.tags[0]).to eq 'tag1'
      end

      it '' do
        expect(@copied_entry.tags[1]).to eq 'tag2'
      end

    end
  end


  describe '#add_tags' do
    context 'valid entry file' do
      before  do
        @copied_file = 'spec/tmp/cli_entry_edit.doentry'
        @options = {'tags' => ['add-tag1', 'add-tag2']}
        FileUtils.cp(valid_entry_file_01, @copied_file)

        @cli = DayoneToolbox::CLI::Entry.new.invoke(:add_tags, [@copied_file], @options)
        @copied_entry = DayoneToolbox::Entry.new(@copied_file)
      end

      it { expect(@cli.class).to eq DayoneToolbox::CLI::Entry }
      it { expect(@copied_entry.tags).to eq ['test', 'add-tag1', 'add-tag2'] }

      after do
        FileUtils.rm(@copied_file)
      end
    end
  end


end
