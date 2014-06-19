module ActiveAdmin
  module Translate

    # Adds a builder method `translate_attributes_table_for` to build a
    # table with translations for a model that has been localized.
    #
    class TranslateAttributesTable < ::ActiveAdmin::Views::AttributesTable

      builder_method :translate_attributes_table_for

      def row(*args, &block)
        title   = args[0]
        options = args.extract_options!
        classes = [:row]
        if options[:class]
          classes << options[:class]
        elsif title.present?
          classes << "row-#{title.to_s.parameterize('_')}"
        end
        options[:class] = classes.join(' ')

        ::I18n.available_locales.each_with_index do |locale, index|
          @table << tr(options) do
            if index == 0
              th :rowspan => ::I18n.available_locales.length do
                header_content_for(title)
              end
            end
            @collection.each do |record|
              td do
                ::I18n.with_locale locale do
                  content_for(record, block || title)
                end
              end
            end
          end
        end
      end

      protected

      def default_id_for_prefix
        'attributes_table'
      end

      def default_class_name
        'attributes_table'
      end

    end
  end
end
