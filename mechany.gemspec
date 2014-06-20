-*- encoding: utf-8 -*-
require File.expand_path('../lib/mechany/', __FILE__)

Gem::Specification.new do |gem|
gem.authors       = ['Leonardo Couto']
gem.email         = ['leonardowrc@gmail.com']
gem.description   = %q{The Ruby Service Bus}
gem.summary       = %q{Service Bus utils}
gem.homepage      = 'https://github.com/wallacyyy/mechany'
gem.files         = `git ls-files`.split($\)
gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
gem.name          = 'mechany'
gem.require_paths = ['lib']
gem.version       = Mechany::VERSION

gem.add_development_dependency 'rspec'
gem.add_development_dependency 'rake'
gem.add_development_dependency 'rake'
gem.add_development_dependency 'celluloid'
gem.add_development_dependency 'savon', '~> 2.0'
gem.add_development_dependency 'mail'
gem.add_development_dependency 'nokogiri'
gem.add_development_dependency 'httparty'

end
