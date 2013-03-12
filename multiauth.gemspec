# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "multiauth"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Harris"]
  s.date = "2013-03-12"
  s.description = "multiauth"
  s.email = "mharris717@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "app/controllers/users/omniauth_callbacks_controller.rb",
    "app/models/identity.rb",
    "app/models/provider.rb",
    "app/models/user.rb",
    "app/models/user_find.rb",
    "app/views/layouts/_user.html.haml",
    "config/initializers/devise.rb",
    "config/initializers/omniauth.rb",
    "config/routes.rb",
    "db/migrate/1_create_users.rb",
    "db/migrate/2_create_identities.rb",
    "lib/multiauth.rb",
    "multiauth.gemspec",
    "spec/multiauth_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/mharris717/multiauth"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "multiauth"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<haml>, [">= 0"])
      s.add_runtime_dependency(%q<mharris_ext>, [">= 0"])
      s.add_runtime_dependency(%q<devise>, [">= 0"])
      s.add_runtime_dependency(%q<omniauth>, ["~> 1.1"])
      s.add_runtime_dependency(%q<omniauth-oauth2>, [">= 0"])
      s.add_runtime_dependency(%q<omniauth-putio>, [">= 0"])
      s.add_runtime_dependency(%q<omniauth-dropbox>, [">= 0"])
      s.add_runtime_dependency(%q<omniauth-evernote>, [">= 0"])
      s.add_runtime_dependency(%q<omniauth-google-oauth2>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.1"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
    else
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<mharris_ext>, [">= 0"])
      s.add_dependency(%q<devise>, [">= 0"])
      s.add_dependency(%q<omniauth>, ["~> 1.1"])
      s.add_dependency(%q<omniauth-oauth2>, [">= 0"])
      s.add_dependency(%q<omniauth-putio>, [">= 0"])
      s.add_dependency(%q<omniauth-dropbox>, [">= 0"])
      s.add_dependency(%q<omniauth-evernote>, [">= 0"])
      s.add_dependency(%q<omniauth-google-oauth2>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.1"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    end
  else
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<mharris_ext>, [">= 0"])
    s.add_dependency(%q<devise>, [">= 0"])
    s.add_dependency(%q<omniauth>, ["~> 1.1"])
    s.add_dependency(%q<omniauth-oauth2>, [">= 0"])
    s.add_dependency(%q<omniauth-putio>, [">= 0"])
    s.add_dependency(%q<omniauth-dropbox>, [">= 0"])
    s.add_dependency(%q<omniauth-evernote>, [">= 0"])
    s.add_dependency(%q<omniauth-google-oauth2>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.1"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
  end
end

