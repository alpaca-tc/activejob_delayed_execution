lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'activejob_delayed_execution/version'

Gem::Specification.new do |spec|
  spec.name          = 'activejob-delayed_execution'
  spec.version       = ActiveJobDelayedExecution::VERSION
  spec.authors       = ['alpaca-tc']
  spec.email         = ['alpaca-tc@alpaca.tc']

  spec.summary       = %q{activejob-delayed_execution provides very simple delayed behavior for Ruby.}
  spec.homepage      = 'https://github.com/alpaca-tc/activejob-delayed_execution'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activejob', '>= 4.2.0'
  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
