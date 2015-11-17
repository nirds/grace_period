# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grace_period/version'

Gem::Specification.new do |spec|
  spec.name          = "grace_period"
  spec.version       = GracePeriod::VERSION
  spec.authors       = ["Whitney-Rose Levis", "Adam Bell", "Mike Pence"]
  spec.email         = ["adamb@nird.us", "whitney@nird.us", "mike@nird.us"]

  spec.summary       = %q{Tool for accounting and paying down technical debt.}
  spec.description   = %q{This tool allows developers to create "grace periods" for paying down
                        technical debt. This debt has an expiration date and warnings will show up
                        when running `rake` and depending on severity will fail once the expiration
                        date has been reached.}
  spec.homepage      = "https://github.com/nirds/grace_period"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'contracts', '~> 0.12.0'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
