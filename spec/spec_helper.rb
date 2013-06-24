require 'rubygems'
require 'bundler/setup'

if RUBY_VERSION > "1.9"
  if ENV['TRAVIS']
    require 'coveralls'
    Coveralls.wear!
  else
    require 'simplecov'
    SimpleCov.start
  end
end

require 'rdiff_simple'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
end

