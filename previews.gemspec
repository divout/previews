# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "previews/version"

Gem::Specification.new do |s|
  s.name        = "previews"
  s.version     = Previews::VERSION
  s.authors     = ["Ivan K"]
  s.email       = ["divout@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Read user reviews of linux packages.}
  s.description = %q{previews lets you read user reviews of linux packages from your console.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rdoc')
  s.add_development_dependency('rake','~> 0.9.2')
  s.add_dependency('hirb', '~> 0.6.0')
  s.add_dependency('json', '~> 1.6.3')
end
