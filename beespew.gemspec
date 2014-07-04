$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "beespew/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "beespew"
  s.version     = Beespew::VERSION
  s.authors     = ["Carsten Zimmermann"]
  s.email       = ["carsten.zimmermann@absolventa.de"]
  s.homepage    = "https://github.com/Absolventa/beespew"
  s.summary     = "Beespew is a naive spam protection plugin for rails using a honeypot"
  s.description = "Beespew is a naive spam protection plugin for rails using a honeypot"
  s.license     = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  s.add_dependency "rails", ">= 4.0", '<= 5.0'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
