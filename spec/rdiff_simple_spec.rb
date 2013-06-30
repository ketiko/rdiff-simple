require 'spec_helper'

describe RdiffSimple do
  describe '#execute' do
    context 'when rdiff-backup is installed' do
      before(:each) do
        mock_rdiff_installed(true)
      end

      context 'when no arguments are given' do
        before(:each) do
          subject.stub(:system).with('rdiff-backup').and_return(false)
        end

        it 'should return false' do
          subject.execute.should be_false
        end
      end

      context 'when arguments are given' do
        before(:each) do
          subject.stub(:system).with('rdiff-backup', '--version').and_return(true)
        end

        it 'should return true' do
          subject.execute('--version').should be_true
        end
      end
    end

    context 'when rdiff-backup is not installed' do
      before(:each) do
        mock_rdiff_installed(false)
      end

      it 'should raise an exception' do
        expect { subject.execute('--version') }.to raise_error(RdiffSimple::NotInstalledError)
      end
    end
  end

  describe '#installed?' do
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

  def mock_rdiff_installed(value)
    subject.stub(:system).with('which rdiff-backup').and_return(value)
  end
end
