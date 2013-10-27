require 'spec_helper'

describe RdiffSimple::RdiffBackup do
  let(:source) { '~/Documents' }
  let(:destination) { '~/Test' }
  let(:status) { double('status', exitstatus: Random.rand(100)) }
  let(:open3) { double('open3') }

  subject(:backup) { RdiffSimple::RdiffBackup.new(double('logger'), open3) }

  describe '#backup' do
    let(:args) { "rdiff-backup --exclude-other-filesystems --verbosity 5 --exclude *.png #{source} #{destination}" }

    subject { backup.backup(source, destination, :exclude_other_filesystems, verbosity: 5, exclude: '*.png') }

    before do
      expect(open3).to receive(:capture3).with(args) { ['', '', status] }
    end

    it 'returns the exit code' do
      expect(subject).to eq status.exitstatus
    end
  end

  describe '#verify' do
    let(:args) { "rdiff-backup --verify-at-time now #{destination}" }

    subject { backup.verify destination }

    before do
      expect(open3).to receive(:capture3).with(args) { ['', '', status] }
    end

    it 'returns the exit code' do
      expect(subject).to eq status.exitstatus
    end
  end

  describe '#verify_at_time' do
    let(:args) { "rdiff-backup --verify-at-time now #{destination}" }

    subject { backup.verify_at_time destination, 'now' }

    before do
      expect(open3).to receive(:capture3).with(args) { ['', '', status] }
    end

    it 'returns the exit code' do
      expect(subject).to eq status.exitstatus
    end
  end
end
