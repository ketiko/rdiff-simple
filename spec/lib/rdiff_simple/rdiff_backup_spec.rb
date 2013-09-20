require 'spec_helper'

describe RdiffSimple::RdiffBackup do
  let(:args) { 'rdiff-backup --exclude-other-filesystems --verbosity 5 --exclude *.png ~/Documents ~/Test' }
  let(:status) { double('status', exitstatus: Random.rand(100)) }
  let(:open3) { double('open3') }
  let(:backup) { RdiffSimple::RdiffBackup.new(double('logger'), open3) }

  subject { backup.execute('~/Documents', '~/Test', :exclude_other_filesystems, verbosity: 5, exclude: '*.png') }

  describe '#backup' do
    before do
      expect(open3).to receive(:capture3).with(args) { ['', '', status] }
    end

    it 'returns the exit code' do
      expect(subject).to eq status.exitstatus
    end
  end
end
