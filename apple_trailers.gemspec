# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apple_trailers/version'

Gem::Specification.new do |gem|
  gem.name          = "apple_trailers"
  gem.version       = AppleTrailers::VERSION
  gem.authors       = ["Avi Charlop", "Sean Stavropoulos"]
  gem.email         = ["avi@taktdigital.com", "seans@fullscreen.net"]
  gem.description   = "Description of apple trailers"
  gem.summary       = "Summary of apple trailers"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
