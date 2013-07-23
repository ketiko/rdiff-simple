require 'open3'

module RdiffSimple
  module RdiffBackup
    def self.execute(*args)
      raise NotInstalledError, 'rdiff-backup not installed' unless installed?

      command = ['rdiff-backup', args].flatten!.compact.join(' ').strip

      output, status = Open3.capture2e(command)
      STDOUT.write output
      status == EXIT_CODE[:success]
    end

    def self.installed?
      output, status = Open3.capture2e(COMMANDS[:installed])
      status == EXIT_CODE[:success]
    end
  end
end
