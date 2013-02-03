# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require "milo/version"

Gem::Specification.new do |s|
  s.name                    = "milo"
  s.version                  = Milo::VERSION
  s.authors                 = ["victorhazbun87"]
  s.email                    = ["victorhazbun87@gmail.com"]
  s.description           = %q{Track in real time the price and availability of every product carried by every location of every merchant through eBay Milo API.}
  s.summary              = %q{Ruby wrapper for the eBay Milo API}
  s.homepage            = "http://victorhazbun87.github.com/milo/"

  s.files                      = `git ls-files`.split("\n")
  s.test_files               = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables           = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths        = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "vcr"
  s.add_development_dependency "fakeweb"
  s.add_development_dependency "json_spec"
  s.add_dependency "curb"
  s.add_dependency "activesupport"
  s.add_dependency "crack"
end
