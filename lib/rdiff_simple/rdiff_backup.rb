require 'logger'
require 'open3'

module RdiffSimple
  class RdiffBackup
    def initialize(logger = Logger.new(STDOUT))
      @logger = logger
    end

    def backup(source, destination, options = [])
      command = ['rdiff-backup', *options, source, destination].flatten.compact.join(' ').strip

      out, err, result = Open3.capture3(command)

      @logger.info(out) if out.length > 0
      @logger.error(err) if err.length > 0

      return result.exitstatus
    end
  end
end
