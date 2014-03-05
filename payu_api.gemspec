# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'payu_api/version'

Gem::Specification.new do |spec|
  spec.name          = "payu_api"
  spec.version       = PayuApi::VERSION
  spec.authors       = ["Alexander Giraldo"]
  spec.email         = ["alexgr200@gmail.com"]
  spec.description   = %q{PayuApi gem enable you to interact and use services from the Payu Platform, written in ruby}
  spec.summary       = %q{PayuApi gem enable you to interact and use services from the Payu Platform}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
