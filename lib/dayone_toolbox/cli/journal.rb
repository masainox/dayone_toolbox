
class DayoneToolbox::CLI::Journal < Thor
  class << self
    def exit_on_failure?
      true
    end
  end


  desc "search JOURNAL_FILE OPTION", "Search entry files in Journal.dayone"
  option :tags, :type => :array, :aliases => :t
  option :uuid, :aliases => :u
  option :starred, :type => :boolean, :aliases => :s
  option :time_zone, :aliases => :z
  def search(journal_path)
    DayoneToolbox::Journal.new(journal_path).entries.each do |file|
      api =  DayoneToolbox::API::SearchEntry.new(file, search_options).exec
      puts api.entry.file if api.result
    end
    self
  end


  desc "search-tag JOURNAL_FILE OPTION", "Search entry files in Journal.dayone"
  option :include, :aliases => :i
  option :not, :aliases => :n
  def search_tag(journal_path)
    DayoneToolbox::Journal.new(journal_path).entries.each do |file|
      api =  DayoneToolbox::API::SearchEntryByTag.new(file, options).exec
      puts api.entry.file if api.result
    end
    self
  end


private
  def search_options
    new_options = options.dup
    new_options['tags'] = []  if options.has_key?('tags') and options['tags'].nil?
    new_options
  end
end
