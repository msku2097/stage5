# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_can/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_can"
  spec.version       = RubyCan::VERSION
  spec.authors       = ["Tomek Rabczak","Craig Smith"]
  spec.email         = ["craig@theailabs.com"]
  spec.summary       = %q{ruby_can - Raw CAN Bus Module}
  spec.description   = %q{ruby_can - Raw library for listening and sending CAN bus packets over SocketCAN}
  spec.homepage      = ""
  spec.license       = "GPLv3"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "cucumber", "~> 2.0"

  # Not just for dev, but used by cucumber
  spec.add_development_dependency('bindata', '~> 2.1')

end
