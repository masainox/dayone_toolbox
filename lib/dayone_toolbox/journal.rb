
class DayoneToolbox::Journal
  ENTRIES_DIR = 'entries/'
  PHOTOS_DIR = 'photos/'

  attr_reader :path, :entries_path, :photos_path
  def initialize(dir_path)
    @path = dir_path
    @entries_path = File.join(@path, ENTRIES_DIR)
    @photos_path = File.join(@path, PHOTOS_DIR)
  end

  def entries
    Dir.glob("#{@entries_path}**/*.doentry")
  end
end
