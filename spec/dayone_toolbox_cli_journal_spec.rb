require 'spec_helper'

RSpec.describe DayoneToolbox::CLI::Journal do

  describe '.exit_on_failure?' do
    context 'when valid' do
      it do
        expect(DayoneToolbox::CLI::Journal.exit_on_failure?).to be true
      end
    end
  end

  describe '#search' do
    describe 'when valid' do
      context 'valid journal file' do
        let(:options) { {'tags' => ['tag1', 'tag2']} }

        subject do
          DayoneToolbox::CLI::Journal.new.invoke(:search, [valid_journal_file_01], options)
        end

        it { expect(subject.class).to eq DayoneToolbox::CLI::Journal }
      end
    end
  end


  describe '#search_tag' do
    describe 'when valid' do
      context 'valid journal file' do
        before do
          @options = { 'include': '' }
          @cli = DayoneToolbox::CLI::Journal.new.invoke(:search_tag, [valid_journal_file_01], @options)
        end

        it { expect(@cli.class).to eq DayoneToolbox::CLI::Journal }
      end
    end
  end


end
