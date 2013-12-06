module RdiffSimple
  class RdiffBackup
    attr_accessor :logger, :open3

    def initialize
      yield self if block_given?

      @open3  ||= Open3
      @logger ||= Logger.new(STDOUT)
    end

    def backup(source, destination, *args)
      command_args = OptionsParser.parse *args
      execute "#{command_args} #{source} #{destination}"
    end

    def verify(destination)
      verify_at_time destination, "now"
    end

    def verify_at_time(destination, time)
      execute "--verify-at-time #{time} #{destination}"
    end

    private
    def execute(command)
      output, error, result = open3.capture3 "rdiff-backup #{command}"

      logger.info output unless output.empty?
      logger.error error unless error.empty?

      result.exitstatus
    end
  end
end
