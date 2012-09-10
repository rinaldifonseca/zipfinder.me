# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "zipfinder/version"

Gem::Specification.new do |s|
  s.name        = "zipfinder"
  s.version     = Zipfinder::VERSION
  s.authors     = ["Rinaldi Fonseca"]
  s.email       = ["rinaldifonseca@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A wrapper for ZipFinder.me Service}
  s.description = %q{A wrapper for ZipFinder.me Service}

  s.rubyforge_project = "zipfinder"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_dependency "rest-client"
end
