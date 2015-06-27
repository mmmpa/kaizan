$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kaizan/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "kaizan"
  spec.version     = Kaizan::VERSION
  spec.authors     = ["mmmpa"]
  spec.email       = ["mmmpa.mmmpa@gmail.com"]
  spec.homepage    = "http://mmmpa.net"
  spec.summary     = "TODO: Summary of Kaizan."
  spec.description = "TODO: Description of Kaizan."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  spec.add_dependency "rails", "~> 4.2.3"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "rails", "~> 4.2.1"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rb-readline"
  spec.add_development_dependency 'rspec-html-matchers'
  spec.add_development_dependency "factory_girl_rails"
  spec.add_development_dependency "coveralls"
end
