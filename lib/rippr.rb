require 'ostruct'
require 'discid'
require 'musicbrainz'
require 'musicbrainz_discid'
require 'rippr/version'

module Rippr
  class MetaData
    attr_accessor :releases

    def initialize(discid)
      MusicBrainz.configure do |c|
        c.app_name = "Rippr"
        c.app_version = "0.1"
        c.contact = "rippr@danbarber.me"
      end
      @discid = discid
    end

    def choose_release
      return releases[0] if releases.count == 1
      puts "There are multiple matches, please choose:"
      releases.to_enum.with_index(1) do |release, index|
        puts "#{index}: #{release.title} (#{release.country})"
      end
      print "Choose a release: "
      index = STDIN.gets.chomp.to_i
      releases[index - 1] unless index.zero?
    end

    def releases
      @releases ||= MusicBrainz::Release.find_by_discid(@discid)
    end
  end
end
