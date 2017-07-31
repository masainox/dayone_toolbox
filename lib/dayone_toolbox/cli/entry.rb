
class DayoneToolbox::CLI::Entry < Thor
  class << self
    def exit_on_failure?
      true
    end
  end

  attr_reader :api


  desc "fetch ENTRY_FILE OPTION", "Fetch values of .doentry file"
  option :tags, :aliases => :t
  option :uuid, :aliases => :u
  option :entry_text, :aliases => :e
  option :creation_date, :aliases => :d
  option :creator, :aliases => :c
  option :starred, :aliases => :s
  option :time_zone, :aliases => :z
  option :location, :aliases => :l
  option :weather, :aliases => :w
  def fetch(file)
    @api = DayoneToolbox::API::FetchEntry.new(file, options).exec
    return self if (@api.result.nil? || @api.result.empty?)
    puts JSON.generate(@api.result)
    self
  end


  desc "edit ENTRY_FILE OPTION", "Edit values of .doentry file"
  option :tags, :type => :array, :aliases => :t
  option :uuid, :aliases => :u
  option :entry_text, :aliases => :e
  option :creation_date, :aliases => :d
  option :creator, :aliases => :c
  option :starred, :type => :boolean, :aliases => :s
  option :time_zone, :aliases => :z
  option :location, :aliases => :l
  option :weather, :aliases => :w
  def edit(file)
    @api = DayoneToolbox::API::EditEntry.new(file, options).exec.store
    puts @api.result
    self
  end


  desc "add-tags ENTRY_FILE OPTION", "Add values to .doentry file"
  option :tags, :type => :array, :aliases => :t
  def add_tags(file)
    @api = DayoneToolbox::API::AddEntry.new(file, options).exec.store
    puts @api.result
    self
  end


  desc "search ENTRY_FILE OPTION", "Search values of .doentry file"
  option :tags, :type => :array, :aliases => :t
  option :uuid, :aliases => :u
  option :starred, :type => :boolean, :aliases => :s
  option :time_zone, :aliases => :z
  def search(file)
    @api = DayoneToolbox::API::SearchEntry.new(file, search_options).exec
    puts @api.result
    self
  end

private
  def search_options
    new_options = options.dup
    new_options['tags'] = []  if options.has_key?('tags') and options['tags'].nil?
    new_options
  end
end
