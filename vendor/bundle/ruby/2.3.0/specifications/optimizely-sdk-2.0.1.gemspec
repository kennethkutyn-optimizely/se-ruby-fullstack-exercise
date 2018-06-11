# -*- encoding: utf-8 -*-
# stub: optimizely-sdk 2.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "optimizely-sdk".freeze
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Optimizely".freeze]
  s.date = "2018-04-25"
  s.description = "A Ruby SDK for Optimizely's Full Stack product.".freeze
  s.email = ["developers@optimizely.com".freeze]
  s.homepage = "https://www.optimizely.com/".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Ruby SDK for Optimizely's testing framework".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4.0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.51.0"])
      s.add_runtime_dependency(%q<httparty>.freeze, ["~> 0.11"])
      s.add_runtime_dependency(%q<json-schema>.freeze, ["~> 2.6"])
      s.add_runtime_dependency(%q<murmurhash3>.freeze, ["~> 0.1"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.4.0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.51.0"])
      s.add_dependency(%q<httparty>.freeze, ["~> 0.11"])
      s.add_dependency(%q<json-schema>.freeze, ["~> 2.6"])
      s.add_dependency(%q<murmurhash3>.freeze, ["~> 0.1"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.51.0"])
    s.add_dependency(%q<httparty>.freeze, ["~> 0.11"])
    s.add_dependency(%q<json-schema>.freeze, ["~> 2.6"])
    s.add_dependency(%q<murmurhash3>.freeze, ["~> 0.1"])
  end
end
