# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "emotidragon/version"

Gem::Specification.new do |s|
  s.name        = 'emotidragon'
  s.version     = Emotidragon::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chris Nixon"]
  s.email       = ['chris@liamneesonsarm.com']
  s.homepage    = ""
  s.summary     = %q{Emoticons! ROAR!}
  s.description = %q{A simple gem to collect an array of, get sentiment about a string based on, determine if a string contains...emoticons}

  s.add_development_dependency "rspec"

  s.rubyforge_project = "emotidragon"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
