
module DayoneToolbox::API
end


class DayoneToolbox::API::Base
  attr_reader :entry, :result, :cli_exit_code
  def initialize(file, options={})
    @file = file
    @entry = DayoneToolbox::Entry.new(@file)
    @options = options
    @result = nil
  end

  def store(path = @file)
    File.open(path, 'w') do |f|
      f.puts @entry.to_plist
    end
    self
  end
end


class DayoneToolbox::API::SearchEntry < DayoneToolbox::API::Base
  def plist_options
    new_options = {}
    @options.map do |k, v|
      new_options.merge!(DayoneToolbox::Entry.entry_attributes[k] => v)
    end
    new_options
  end

  def exec
    @result = plist_options < @entry.to_h
    self
  end
end


class DayoneToolbox::API::SearchEntryByTag < DayoneToolbox::API::Base
  def tag_include?
    @entry.tags.include?(@options[:include])
  end

  def tag_not_include?
    ! @entry.tags.include?(@options[:not])
  end

  def exec
    if @options[:include]
      @result = tag_include?
    elsif @options[:not]
      @result = tag_not_include?
    end
    self
  end
end


class DayoneToolbox::API::AddEntry < DayoneToolbox::API::Base
  def exec
    hash = {}
    @options.each do |k, v|
      current_value = @entry.send("#{k}")
      set_value = current_value << v
      set_value.flatten! if set_value.class == Array
      @entry.send("#{k}=", set_value)
      hash.merge!({"#{k}" => set_value})
    end
    @result = hash
    self
  end
end


class DayoneToolbox::API::EditEntry < DayoneToolbox::API::Base
  def exec
    hash = {}
    @options.each do |k, v|
      @entry.send("#{k}=", v)
      hash.merge!({"#{k}" => v})
    end
    @result = hash
    self
  end
end


class DayoneToolbox::API::FetchEntry < DayoneToolbox::API::Base
  def exec
    hash = {}
    @options.each do |k, v|
      hash.merge!({ "#{k}" => @entry.send(k)})
    end
    @result = hash
    self
  end
end
