require "rdiff_simple/version"

module RdiffSimple
  def self.execute(*args)
    raise 'rdiff-backup not installed' unless installed?

    system('rdiff-backup', *args)
  end

  def self.installed?
    system('which rdiff-backup')
  end
end
