require 'spec_helper'

describe RdiffSimple do
  describe '#execute' do
    context 'when rdiff-backup is installed' do
      before do
        mock_rdiff_installed(true)
      end

      context 'when no arguments are given' do
        before do
          RdiffSimple.stub(:system).with('rdiff-backup').and_return(false)
        end

        subject { RdiffSimple.execute }

        it { should be_false }
      end

      context 'when arguments are given' do
        before do
          RdiffSimple.stub(:system).with('rdiff-backup', '--version').and_return(true)
        end

        subject { RdiffSimple.execute('--version') }

        it { should be_true }
      end
    end

    context 'when rdiff-backup is not installed' do
      before do
        mock_rdiff_installed(false)
      end

      it 'should raise an exception' do
        expect { subject.execute('--version') }.to raise_error(RdiffSimple::NotInstalledError)
      end
    end
  end

  describe '#installed?' do
    context 'when rdiff-backup is installed' do
      before do
        mock_rdiff_installed(true)
      end

      it { should be_installed }
    end

    context 'when rdiff-backup is not installed' do
      before do
        mock_rdiff_installed(false)
      end

      it { should_not be_installed }
    end

  end

  def mock_rdiff_installed(value)
    RdiffSimple.stub(:system).with('which rdiff-backup').and_return(value)
  end
end
