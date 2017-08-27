
class DayoneToolbox::Entry
  KEY_TAGS = 'Tags'
  KEY_UUID = 'UUID'
  KEY_ENTRY_TEXT = 'Entry Text'
  KEY_CREATION_DATE = 'Creation Date'
  KEY_CREATOR = 'Creator'
  KEY_STARRED = 'Starred'
  KEY_TIME_ZONE = 'Time Zone'
  KEY_LOCATION = 'Location'
  KEY_WEATHER = 'Weather'


  def self.entry_attributes
    {
      "tags" => KEY_TAGS,
      "uuid" => KEY_UUID,
      "entry_text" => KEY_ENTRY_TEXT,
      "creation_date" => KEY_CREATION_DATE,
      "creator" => KEY_CREATOR,
      "starred" => KEY_STARRED,
      "time_zone" => KEY_TIME_ZONE,
      "location" => KEY_LOCATION,
      "weather" => KEY_WEATHER
    }
  end


  attr_reader :file, :journal_dir
  def initialize(file)
    @file = File.expand_path(file)
    @journal_dir = nil
    Pathname.new(file).ascend do |v|
      @journal_dir =  v.expand_path.to_s if v.basename.to_s.match('.dayone')
    end
    @hash = Plist.parse_xml(@file)
  end


  def to_plist
    @hash.to_plist
  end


  def to_h
    @hash
  end


  def tags ; @hash[KEY_TAGS] ; end
  def tags=(attr) ; @hash[KEY_TAGS] = attr ; end
  def tags? ; @hash.has_key?(KEY_TAGS) ; end

  def uuid ; @hash[KEY_UUID] ; end
  def uuid=(attr) ; @hash[KEY_UUID] = attr ; end
  def uuid? ; @hash.has_key?(KEY_UUID) ; end

  def entry_text ; @hash[KEY_ENTRY_TEXT] ; end
  def entry_text=(attr) ; @hash[KEY_ENTRY_TEXT] = attr ; end
  def entry_text? ; @hash.has_key?(KEY_ENTRY_TEXT) ; end

  def creation_date ; @hash[KEY_CREATION_DATE] ; end
  def creation_date=(attr) ; @hash[KEY_CREATION_DATE] = attr ; end
  def creation_date? ; @hash.has_key?(KEY_CREATION_DATE) ; end

  def creator ; @hash[KEY_CREATOR] ; end
  def creator=(attr) ; @hash[KEY_CREATOR] = attr ; end
  def creator? ; @hash.has_key?(KEY_CREATOR) ; end

  def starred ; @hash[KEY_STARRED] ; end
  def starred=(attr) ; @hash[KEY_STARRED] = attr ; end
  def starred? ; @hash.has_key?(KEY_STARRED) ; end

  def time_zone ; @hash[KEY_TIME_ZONE] ; end
  def time_zone=(attr) ; @hash[KEY_TIME_ZONE] = attr ; end
  def time_zone? ; @hash.has_key?(KEY_TIME_ZONE) ; end

  def location ; @hash[KEY_LOCATION] ; end
  def location=(attr) ; @hash[KEY_LOCATION] = attr ; end
  def location? ; @hash.has_key?(KEY_LOCATION) ; end

  def weather ; @hash[KEY_WEATHER] ; end
  def weather=(attr) ; @hash[KEY_WEATHER] = attr ; end
  def weather? ; @hash.has_key?(KEY_WEATHER) ; end

  def photo
    jpg = File.join("#{@journal_dir}", "photos/#{uuid}.jpg")
    File.exist?(jpg) ? jpg.to_s : nil
  end

  def photo?
    photo ? true : false
  end

  def custom_key(key)
    @hash[key]
  end

  def custom_key?(key)
    @hash.has_key?("#{key}")
  end

  def set_custom_key(key, value)
    @hash["#{key}"] = value
  end
end
