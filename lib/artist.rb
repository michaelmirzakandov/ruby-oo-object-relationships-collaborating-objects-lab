require 'pry'
class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        @songs << song
    end

    def songs
        Song.all.each do |song|
            if song.artist == self
                add_song(song)
            end
        end
        @songs
    end

    def self.find_or_create_by_name(name)
        self.all.each do |artist|
            if artist.name == name
                return artist
            end
        end
        self.new(name)
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end
end