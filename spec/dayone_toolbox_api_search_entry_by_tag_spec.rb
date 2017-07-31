require 'spec_helper'

RSpec.describe DayoneToolbox::API::SearchEntryByTag do

  describe '#exec' do
    context 'valid file' do
      context 'valid params :include' do
        before do
          @options = { 'include':  'test' }
          @api = DayoneToolbox::API::SearchEntryByTag.new(valid_entry_file_01, @options)
          @target = @api.exec
        end

        it { expect(@api.result).to eq true }
      end


      context 'valid params :not' do
        before do
          @options = { 'not':  'test' }
          @api = DayoneToolbox::API::SearchEntryByTag.new(valid_entry_file_01, @options)
          @target = @api.exec
        end

        it { expect(@api.result).to eq false }
      end


      context 'invalid params :include' do
        before do
          @options = { 'include':  'test2' }
          @api = DayoneToolbox::API::SearchEntryByTag.new(valid_entry_file_01, @options)
          @target = @api.exec
        end

        it { expect(@api.result).to eq false }
      end


      context 'invalid params :not' do
        before do
          @options = { 'not':  'test2' }
          @api = DayoneToolbox::API::SearchEntryByTag.new(valid_entry_file_01, @options)
          @target = @api.exec
        end

        it { expect(@api.result).to eq true }
      end


    end
  end

end
