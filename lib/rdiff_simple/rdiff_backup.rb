module RdiffSimple
  class RdiffBackup
    def initialize(logger = Logger.new(STDOUT), open3 = Open3)
      @logger = logger
      @open3 = open3
    end

    def backup(source, destination, *args)
      command_arguments = OptionsParser.parse *args
      run_command "#{command_arguments.strip} #{source} #{destination}"
    end

    def verify(destination)
      verify_at_time destination, "now"
    end

    def verify_at_time(destination, time)
      run_command "--verify-at-time #{time} #{destination}"
    end

    private
    def run_command(command)
      output, error, result = @open3.capture3 "rdiff-backup #{command}"

      @logger.info output if output.length > 0
      @logger.error error if error.length > 0

      result.exitstatus
    end
  end
end
