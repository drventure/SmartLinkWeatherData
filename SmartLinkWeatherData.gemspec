# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'SmartLinkWeatherData/version'

Gem::Specification.new do |spec|
  spec.name          = "SmartLinkWeatherData"
  spec.version       = SmartLinkWeatherData::VERSION
  spec.authors       = ["darin"]
  spec.email         = ["mail@darinhiggins.com"]

  if spec.respond_to?(:metadata)
    #spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Test gem for Retrieving Weather Data}
  spec.description   = %q{Test gem for Retrieving Weather Data}
  spec.homepage      = "http://darinhiggins.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  #Files that are used for testing the gem. This line cleverly
  #               supports TestUnit, MiniTest, RSpec, and Cucumber
  spec.test_files    = `git ls-files -- {test,spec,features}`.split("\n")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "json"
  #spec.add_runtime_dependency "mysql"
  #spec.add_runtime_dependency "sqlite3"
  #spec.add_runtime_dependency 'rails', '4.2.0'
end
