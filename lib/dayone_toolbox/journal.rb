
class DayoneToolbox::Journal
  ENTRIES_DIR = 'entries/'
  PHOTOS_DIR = 'photos/'

  attr_reader :path, :expand_path, :entries_path, :photos_path
  def initialize(dir_path)
    @path = dir_path
    @expand_path = File.expand_path(@path)
    @entries_path = File.join(@expand_path, ENTRIES_DIR)
    @photos_path = File.join(@expand_path, PHOTOS_DIR)
  end

  def entries
    Dir.glob("#{@entries_path}**/*.doentry", File::FNM_CASEFOLD)
  end

  def photos
    Dir.glob("#{@photos_path}**/*.jpg", File::FNM_CASEFOLD)
  end
end
