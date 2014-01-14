# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rippr/version'

Gem::Specification.new do |spec|
  spec.name          = "rippr"
  spec.version       = Rippr::VERSION
  spec.authors       = ["Dan Barber"]
  spec.email         = ["dan@new-bamboo.co.uk"]
  spec.description   = %q{Rip your CD's on the command line. Uses MusicBrainz and CDParanoia.}
  spec.summary       = %q{Rip your CD's on the command line.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "discid"
  spec.add_dependency "musicbrainz"
  spec.add_dependency "thor"
end
