# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vibe/version'

Gem::Specification.new do |spec|
  spec.name          = "vibe"
  spec.version       = Vibe::VERSION
  spec.authors       = ["stephenhu"]
  spec.email         = ["epynonymous@outlook.com"]
  spec.summary       = %q{RESTful API for events.}
  spec.description   = %q{Ruby/Sinatra based RESTful API for events.}
  spec.homepage      = "https://github.com/stephenhu/vibe"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 4.1"
  spec.add_dependency "bcrypt", "~> 3.1"
  spec.add_dependency "sinatra", "~> 1.4"
  spec.add_dependency "sqlite3", "~> 1.3"
  spec.add_dependency "thin", "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

end

