# -*- encoding: utf-8 -*-
require File.expand_path('../lib/active_admin/translate/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Michael Kessler', 'Twintags']
  gem.email         = %w(michi@flinkfinger.com)
  gem.summary       = %q{Translate models with ActiveAdmin.}
  gem.description   = %q{Translate your models in ActiveAdmin with Globalize.}
  gem.homepage      = 'https://github.com/twintags/activeadmin-translate'

  gem.files         = Dir['{app,lib,config}/**/*'] + %w(LICENSE README.md CHANGELOG.md CONTRIBUTING.md)
  gem.name          = 'activeadmin-translate'
  gem.require_paths = %w(lib)
  gem.version       = ActiveAdmin::Translate::VERSION
  gem.license       = 'MIT'

  gem.add_dependency 'activeadmin'
  gem.add_dependency 'globalize'
  gem.add_dependency 'railties'
end
