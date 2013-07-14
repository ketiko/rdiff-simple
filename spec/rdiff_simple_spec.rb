require 'spec_helper'

describe RdiffSimple do
  describe '#execute' do
    context 'when rdiff-backup is installed' do
      before { mock_rdiff_installed :yes }

      context 'when no arguments are given' do
        before { mock_rdiff_command '', :failed }
        subject { RdiffSimple.execute('') }

        it { should be_false }
      end

      context 'when arguments are given' do
        before { mock_rdiff_command '--version', :succeeded }
        subject { RdiffSimple.execute('--version') }

        it { should be_true }
      end
    end

    context 'when rdiff-backup is not installed' do
      before { mock_rdiff_installed false }

      it 'should raise an exception' do
        expect { subject.execute('--version') }.to raise_error(RdiffSimple::NotInstalledError)
      end
    end
  end

  describe '#installed?' do
    context 'when rdiff-backup is installed' do
      before { mock_rdiff_installed :yes }

      it { should be_installed }
    end

    context 'when rdiff-backup is not installed' do
      before { mock_rdiff_installed :no }

      it { should_not be_installed }
    end
  end
end
