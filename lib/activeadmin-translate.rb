require 'active_admin'
require 'globalize'

require 'active_admin/version'
require 'active_admin/translate/engine'
require 'active_admin/translate/form_builder'
require 'active_admin/views/translate_attributes_table'

ActiveAdmin::FormBuilder.send(:include, ::ActiveAdmin::Translate::FormBuilder)
