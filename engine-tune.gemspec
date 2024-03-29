# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "engine-tune"
  s.version = "0.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Theo Mills"]
  s.date = "2012-03-30"
  s.description = "Determine how well your engine will run under certain meteorological and geological conditions."
  s.email = "twmills@twmills.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "engine-tune.gemspec",
    "lib/engine-tune.rb",
    "lib/engine-tune/calculations.rb",
    "lib/engine-tune/calculator.rb",
    "test/helper.rb",
    "test/test_calculations.rb",
    "test/test_calculator.rb",
    "test/test_engine_tune.rb",
    "test/test_suite.rb"
  ]
  s.homepage = "http://github.com/twmills/engine-tune"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Determine how well your engine will run under certain meteorological and geological conditions."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

