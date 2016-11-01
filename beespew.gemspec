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

  s.required_ruby_version = '>= 2.2.2'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "rails", ">= 4.0", '< 5.1'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", '>= 3.0.0'
  s.add_development_dependency "rspec-html-matchers"
  s.add_development_dependency "appraisal"
end
