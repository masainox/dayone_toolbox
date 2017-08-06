require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

require 'timecop'
Timecop.freeze('1970-01-01')

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'dayone_toolbox'

def fixtures_path ; File.expand_path('../fixtures', __FILE__) ; end
def journal_path ; File.join(fixtures_path,'journal') ; end
def entry_path ; File.join(fixtures_path,'entry') ; end

def valid_entry_file_01 ; File.join(entry_path, 'valid_01.doentry') ; end
def valid_entry_file_02 ; File.join(entry_path, 'valid_02.doentry') ; end
def valid_entry_file_03 ; File.join(entry_path, 'valid_03_no_tags.doentry') ; end
def valid_entry_file_05 ; File.join(entry_path, 'valid_05_custom_key.doentry') ; end
def valid_entry_file_06 ; 'spec/fixtures/journal/valid_journal_02.dayone/entries/DC2245B372BA41D6A4BA6CF323D38E89.doentry'; end
def valid_entry_file_07 ; 'spec/fixtures/journal/valid_journal_02.dayone/entries/valid_01.doentry'; end

def invalid_entry_file_01 ; File.join(entry_path, 'invalid_01.doentry') ; end

def valid_journal_file_01 ; File.join(journal_path, 'valid_journal_01.dayone') ; end
def valid_journal_file_02 ; File.join(journal_path, 'valid_journal_02.dayone') ; end
