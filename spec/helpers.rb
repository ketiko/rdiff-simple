module Helpers
  def mock_rdiff_installed(value)
    result = value == :yes
    RdiffSimple.stub(:system).with('which rdiff-backup').and_return(result)
  end

  def mock_rdiff_command(command, value)
    result = value == :succeeded

    commands = [ 'rdiff-backup' ]
    commands << command unless command.empty?

    RdiffSimple.stub(:system).with(*commands).and_return(result)
  end
end
