module RdiffSimple
  class OptionsParser
    def self.parse(*args)
      options = args.extract_options!

      args.reverse!

      source = args.pop
      destination = args.pop

      flags = args.reverse.map { |flag| flag.size == 1 ? "-#{flag}" : "--#{flag}" } * ' '
      arguments = options.map { |key, value| (key.size == 1 ? "-#{key}" : "--#{key}") + " #{value}" } * ' '

      "#{flags} #{arguments} #{source} #{destination}".dasherize.strip
    end
  end
end
