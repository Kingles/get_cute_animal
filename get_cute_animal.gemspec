# -*- encoding: utf-8 -*-
require File.expand_path('../lib/get_cute_animal/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kingles"]
  gem.email         = ["kerosuppi@gmail.com"]
  gem.description   = %q{Ask for cute animal, get cute animal}
  gem.summary       = %q{Ask for cute animal, get cute animal}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "get_cute_animal"
  gem.require_paths = ["lib"]
  gem.version       = GetCuteAnimal::VERSION
  gem.add_runtime_dependency 'flickraw'
  gem.add_runtime_dependency 'rmagick'
end
