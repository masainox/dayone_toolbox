require 'spec_helper'

RSpec.describe DayoneToolbox::API::SearchEntry do

  describe '#exec' do
    context 'valid file' do
      context 'valid uuid' do
        let(:options) do
          { "uuid" => 'DD950ADE4D9B4FFD88748FF825D50C99' }
        end

        subject do
          DayoneToolbox::API::SearchEntry.new(valid_entry_file_01, options).exec
        end

        it { expect(subject.class).to eq DayoneToolbox::API::SearchEntry }
        it { expect(subject.result).to eq true }
      end

      context 'valid tags' do
        let(:options) do
          { "tags" => ['test'] }
        end

        subject do
          DayoneToolbox::API::SearchEntry.new(valid_entry_file_01, options).exec
        end

        it { expect(subject.class).to eq DayoneToolbox::API::SearchEntry }
        it { expect(subject.result).to eq true }
      end

    end
  end

end
