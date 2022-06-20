class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        name = filename.split(" - ")
        song =self.new(name[1])
        song.artist = Artist.find_or_create_by_name(name[0])
        song
    end
    
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

        
    
end
