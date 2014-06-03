# -*- encoding: utf-8 -*-
require File.expand_path('../lib/active_admin/translate/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Michael Kessler']
  gem.email         = %w(michi@flinkfinger.com)
  gem.summary       = %q{Translate models with ActiveAdmin.}
  gem.description   = %q{Translate your models in ActiveAdmin with Globalize3 or Traco.}
  gem.homepage      = 'https://github.com/netzpirat/activeadmin-translate'

  gem.files         = Dir['{app,lib,config}/**/*'] + %w(LICENSE README.md CHANGELOG.md CONTRIBUTING.md)
  gem.name          = 'activeadmin-translate'
  gem.require_paths = %w(lib)
  gem.version       = ActiveAdmin::Translate::VERSION

  gem.add_dependency 'activeadmin'
  gem.add_dependency 'railties'
end
