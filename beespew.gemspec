$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "beespew/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "beespew"
  s.version     = Beespew::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Beespew."
  s.description = "TODO: Description of Beespew."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.0", '<= 5.0'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
end