module RdiffSimple
  class RdiffBackup
    def process(args)
      `rdiff-backup #{args.source} #{args.destination}`
    end
  end
end
