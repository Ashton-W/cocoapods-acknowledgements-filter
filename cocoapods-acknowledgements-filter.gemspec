# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-acknowledgements-filter/version'

Gem::Specification.new do |spec|
  spec.name          = "cocoapods-acknowledgements-filter"
  spec.version       = CocoapodsAcknowledgementsFilter::VERSION
  spec.authors       = ["Ashton Williams"]
  spec.summary       = %q{CocoaPods plugin that filters the pods listed in Acknowledgements.}
  spec.homepage      = "https://github.com/Ashton-W/cocoapods-acknowledgements-filter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
