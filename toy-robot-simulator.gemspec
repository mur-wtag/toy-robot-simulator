# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toy/robot/simulator/version'

Gem::Specification.new do |spec|
  spec.name          = "toy-robot-simulator"
  spec.version       = Toy::Robot::Simulator::VERSION
  spec.authors       = ["Mahbub Rony"]
  spec.email         = ["code.iroon@gmail.com"]

  spec.summary       = 'Summary of gem'
  spec.description   = 'It is a description'
  spec.homepage      = 'http://rubygems.org/gems/toy-robot-simulator'
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
