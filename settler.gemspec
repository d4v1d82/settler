# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "settler"
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Reinier de Lange"]
  s.date = "2013-08-12"
  s.description = "Settler can be used for defining application wide settings in Rails. Settings are loaded from a YAML file and stored in the database using ActiveRecord to allow users to update settings on the fly. The YAML configuration allows you to not only specify defaults, but setting value validations and typecasts as well!"
  s.email = "r.j.delange@nedforce.nl"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".travis.yml",
    "Appraisals",
    "CHANGELOG",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "gemfiles/3.1.gemfile",
    "gemfiles/3.1.gemfile.lock",
    "gemfiles/3.2.gemfile",
    "gemfiles/3.2.gemfile.lock",
    "gemfiles/4.0.gemfile",
    "gemfiles/4.0.gemfile.lock",
    "init.rb",
    "lib/generators/settler/USAGE",
    "lib/generators/settler/settler_generator.rb",
    "lib/generators/settler/templates/migration.rb",
    "lib/generators/settler/templates/settler.yml",
    "lib/setting.rb",
    "lib/settler.rb",
    "lib/type_casters.rb",
    "settler.gemspec",
    "test/custom_typecaster.rb",
    "test/database.yml",
    "test/schema.rb",
    "test/settler.yml",
    "test/test_helper.rb",
    "test/test_settler.rb"
  ]
  s.homepage = "http://github.com/moiristo/settler"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.6"
  s.summary = "Settler manages global application settings in Rails"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.1"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.1"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.1"])
      s.add_dependency(%q<activesupport>, [">= 3.1"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.1"])
    s.add_dependency(%q<activesupport>, [">= 3.1"])
  end
end

