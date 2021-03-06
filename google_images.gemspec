# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_images/version'

Gem::Specification.new do |spec|
  spec.name          = "google_images"
  spec.version       = GoogleImages::VERSION
  spec.authors       = ["Sharipov Ruslan"]
  spec.email         = ["sharipov.ru@gmail.com"]

  spec.summary       = %q{Google Images Custom API client }
  spec.description   = %q{Simple and reliable solution for interacting with Google Images Search API}
  spec.homepage      = "http://github.com/sharipov-ru/google-images"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "http", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "pry", "~> 0.10"
end
