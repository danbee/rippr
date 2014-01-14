require "musicbrainz_discid"
require "rippr/version"

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

    def releases
      @releases ||= MusicBrainz::Release.find_by_discid(@discid)
    end
  end
end

class DiscId
  def self.read(dev)
    OpenStruct.new(id: 'pmzhT6ZlFiwSRCdVwV0eqire5_Y-') # Stubbed for initial testing
  end
end
