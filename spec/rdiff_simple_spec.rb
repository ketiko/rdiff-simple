require 'spec_helper'

describe RdiffSimple do
  describe '#execute' do
    context 'when no arguments are given' do
      it 'should return false' do
        subject.execute.should be_false
      end
    end

    context 'when arguments are given' do
      it 'should return true' do
        subject.execute('--version').should be_true
      end
    end
  end

  describe '#installed?' do
    def mock_rdiff_installed(value)
      subject
      .should_receive(:system)
      .with('which rdiff-backup')
      .and_return(value)
    end

    context 'when rdiff-backup is installed' do
      before(:each) do
        mock_rdiff_installed(true)
      end

      it 'should be true' do
        subject.installed?.should be_true
      end
    end

    context 'when rdiff-backup is not installed' do
      before(:each) do
        mock_rdiff_installed(false)
      end

      it 'should be false' do
        subject.installed?.should be_false
      end
    end
  end
end
