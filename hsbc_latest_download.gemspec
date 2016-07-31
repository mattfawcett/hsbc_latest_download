# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hsbc_latest_download/version'

Gem::Specification.new do |spec|
  spec.name          = "hsbc_latest_download"
  spec.version       = HsbcLatestDownload::VERSION
  spec.authors       = ["Matt Fawcett"]
  spec.email         = ["mail@matthewfawcett.co.uk"]

  spec.summary       = %q{Download latest hsbc transactions as OFX}
  spec.description   = %q{Download latest hsbc transactions as OFX}
  spec.homepage      = "https://github.com/mattfawcett/hsbc_latest_download"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.cert_chain  = ['certs/mattfawcett.pem']
  spec.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/

  spec.add_dependency "selenium-webdriver", "~> 2.53"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
