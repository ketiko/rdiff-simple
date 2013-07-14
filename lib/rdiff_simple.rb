require "rdiff_simple/version"

module RdiffSimple

  class NotInstalledError < Exception; end

  def self.execute(*args)
    raise NotInstalledError, 'rdiff-backup not installed' unless installed?

    system('nice rdiff-backup', *args)
  end

  def self.installed?
    system('which rdiff-backup')
  end
end
