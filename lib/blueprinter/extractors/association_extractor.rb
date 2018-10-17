module Blueprinter
  class AssociationExtractor < Extractor
    def extract(association_name, object, local_options, options={})
      value = options[:extractor].extract(association_name, object, local_options, options)
      return options[:default] if value.nil?
      view = options[:view] || :default
      options[:blueprint].prepare(value, view_name: view, local_options: local_options)
    end
  end
end
