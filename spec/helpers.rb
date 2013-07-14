module Helpers
  def mock_rdiff_installed(value)
    result = value == :yes
    RdiffSimple.stub(:system).with('which rdiff-backup').and_return(result)
  end

  def mock_rdiff_command(command, value)
    result = value == :succeeded

    RdiffSimple.stub(:system).with("rdiff-backup #{command}").and_return(result)
  end
end
