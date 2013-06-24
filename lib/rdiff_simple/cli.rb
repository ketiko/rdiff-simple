require 'rdiff_simple'
require 'thor'

module RdiffSimple
  class CLI < Thor
    include Thor::Actions
  end
end
