#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-

begin
  RUBY_ENGINE
rescue NameError
  RUBY_ENGINE = "ruby"  # Not defined in Ruby 1.8.7
end

Gem::Specification.new do |gem|
  gem.version            = File.read('VERSION').chomp
  gem.date               = File.mtime('VERSION').strftime('%Y-%m-%d')

  gem.name               = 'rdf-mongo'
  gem.homepage           = 'http://ruby-rdf.github.com/rdf-mongo'
  gem.license            = 'MIT License' if gem.respond_to?(:license=)
  gem.summary            = 'A storage adapter for integrating MongoDB and rdf.rb, a Ruby library for working with Resource Description Framework (RDF) data.'
  gem.description        = 'rdf-mongo is a storage adapter for integrating MongoDB and rdf.rb, a Ruby library for working with Resource Description Framework (RDF) data.'

  gem.authors            = ['Pius Uzamere']
  gem.email              = 'pius@alum.mit.edu'

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(LICENSE VERSION README.md) + Dir.glob('lib/**/*.rb')
  gem.require_paths      = %w(lib)
  gem.extensions         = %w()
  gem.test_files         = Dir.glob('spec/*.spec')
  gem.has_rdoc           = false

  gem.required_ruby_version      = '>= 1.9.2'
  gem.requirements               = []
  gem.add_runtime_dependency     'rdf',         '>= 1.1'
  gem.add_runtime_dependency     'mongo',       '>= 1.8.6'

  gem.add_development_dependency 'rdf-spec',    '>= 1.1'
  gem.add_development_dependency 'rspec',       '>= 2.14.0'
  gem.add_development_dependency 'yard' ,       '>= 0.8.7'
  gem.add_development_dependency 'bson_ext' unless  defined?(:RUBY_ENGINE) && RUBY_ENGINE == "jruby"

  # Rubinius has it's own dependencies
  if RUBY_ENGINE == "rbx" && RUBY_VERSION >= "2.1.0"
    gem.add_runtime_dependency    "rubysl-base64"
    gem.add_runtime_dependency    "rubysl-digest"
    gem.add_development_dependency "rubysl-prettyprint"
  end

  gem.post_install_message       = "Have fun! :)"
end
