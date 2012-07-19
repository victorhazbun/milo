# -*- encoding: utf-8 -*-
require File.expand_path('../lib/milo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors                 = ["victorhazbun87"]
  gem.email                    = ["victorhazbun87@gmail.com"]
  gem.description           = %q{Track in real time the price and availability of every product carried by every location of every merchant.}
  gem.summary              = %q{Ruby wrapper for the eBay Milo API}
  gem.homepage            = ""

  gem.files                     = `git ls-files`.split($\)
  gem.executables         = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files              = gem.files.grep(%r{^(test|spec|features)/})
  gem.name                   = "milo"
  gem.require_paths       = ["lib"]
  gem.version       = Milo::VERSION

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "supermodel"
end
