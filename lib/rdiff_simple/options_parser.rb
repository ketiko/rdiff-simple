require 'active_support/core_ext/array/extract_options'
require 'active_support/core_ext/string/inflections'

module RdiffSimple
  class OptionsParser
    def self.parse(*args)
      options = args.extract_options!

      flags = args.map { |flag| flag.size == 1 ? "-#{flag}" : "--#{flag}" } * ' '
      arguments = options.map { |key, value| (key.size == 1 ? "-#{key}" : "--#{key}") + " #{value}" } * ' '

      "#{flags} #{arguments}".dasherize.strip
    end
  end
end
