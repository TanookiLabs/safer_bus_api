$:.push File.expand_path("../lib", __FILE__)
require 'safer_bus_api/version'

Gem::Specification.new do |gem|
  gem.authors       = ["Nathan Bertram"]
  gem.email         = ["nbertram@gmail.com"]
  gem.description   = %q{The Department of Transportation maintains the SaferBusAPI to provide safety information pertaining to transporation companies.}
  gem.summary       = %q{A simple wrapper for the SaferBusAPI}
  gem.homepage      = "http://github.com/TanookiSuitLabs/safer_bus_api"

  gem.require_path = 'lib'
  gem.files         = `git ls-files`.split($\)

  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "safer_bus_api"
  gem.version       = SaferBusApi::VERSION
  gem.license       = 'MIT'

  gem.add_development_dependency 'rspec', '~> 0'
  gem.add_dependency 'typhoeus', '~> 0.6'
end