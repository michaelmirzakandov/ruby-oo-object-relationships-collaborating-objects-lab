
class MP3Importer

    attr_accessor :path

    @@files = []

    def initialize(path)
        @path = path
        @@files << self
    end

    def files
        array_of_files = []
        Dir.foreach(path) do |filename|
            if filename.include?(".mp3")
                array_of_files << filename
            end
        end
        array_of_files
    end

    def import
        files.each do |file|
            Song.new_by_filename(file)
        end
    end


end