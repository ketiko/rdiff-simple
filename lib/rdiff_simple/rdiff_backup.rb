require 'open3'

module RdiffSimple
  class RdiffBackup
    attr_reader :output_log

    def execute(*args)
      raise NotInstalledError, 'rdiff-backup not installed' unless installed?

      command = ['rdiff-backup', args].flatten!.compact.join(' ').strip

      @output_log, status = Open3.capture2e(command)
      status == EXIT_CODE[:success]
    end

    private
    def installed?
      output, status = Open3.capture2e(COMMANDS[:installed])
      status == EXIT_CODE[:success]
    end
  end
end
