# Extend the MusicBrainz library to enable discid lookups.

module MusicBrainz
  module Bindings
    module DiscidReleases
      def parse(xml)
        xml.xpath('./disc/release-list/release').map do |xml|
          MusicBrainz::Bindings::Release.parse(xml)
        end
      end

      extend self
    end
  end
end

module MusicBrainz
  class Release
    class << self
      def find_by_discid(id)
        client.load(:discid, { id: id }, {
          binding: :discid_releases,
          create_models: :release
        })
      end
    end
  end
end
