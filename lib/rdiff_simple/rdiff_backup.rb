module RdiffSimple
  class RdiffBackup
    def initialize(logger = Logger.new(STDOUT), open3 = Open3)
      @logger = logger
      @open3 = open3
    end

    def execute(*args)
      command_arguments = OptionsParser.parse(*args)

      out, err, result = @open3.capture3("rdiff-backup #{command_arguments}".strip)

      @logger.info(out) if out.length > 0
      @logger.error(err) if err.length > 0

      return result.exitstatus
    end
  end
end
