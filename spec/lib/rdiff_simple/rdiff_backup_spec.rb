require 'spec_helper'

describe RdiffSimple::RdiffBackup do
  let(:backup) { RdiffSimple::RdiffBackup.new }

  describe '.execute' do
    context 'when rdiff-backup is installed' do
      before do
        Open3.stub(:capture2e).with(RdiffSimple::COMMANDS[:installed]).and_return(['', 0])
      end

      context 'when no arguments are given' do
        before do
          Open3.stub(:capture2e).with(RdiffSimple::COMMANDS[:rdiff]).and_return(['', 1])
        end

        subject { backup.execute('') }

        it { should be_false }
      end

      context 'when arguments are given' do
        before do
          Open3.stub(:capture2e).with("#{RdiffSimple::COMMANDS[:rdiff]} --version").and_return(['', 0])
        end

        subject { backup.execute('--version') }

        it { should be_true }
      end
    end

    context 'when rdiff-backup is not installed' do
      before do
        Open3.stub(:capture2e).with(RdiffSimple::COMMANDS[:installed]).and_return(['', 1])
      end

      it 'should raise an exception' do
        expect { subject.execute('--version') }.to raise_error(RdiffSimple::NotInstalledError)
      end
    end
  end

  describe '.installed?' do
    context 'when rdiff-backup is installed' do
      before do
        Open3.stub(:capture2e).with(RdiffSimple::COMMANDS[:installed]).and_return(['', 0])
      end

      it { should be_installed }
    end

    context 'when rdiff-backup is not installed' do
      before do
        Open3.stub(:capture2e).with(RdiffSimple::COMMANDS[:installed]).and_return(['', 1])
      end

      it { should_not be_installed }
    end
  end
end
