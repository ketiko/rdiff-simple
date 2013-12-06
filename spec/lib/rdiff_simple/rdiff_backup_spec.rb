require 'spec_helper'

describe RdiffSimple::RdiffBackup do
  let(:source) { '~/Documents' }
  let(:destination) { '~/Test' }
  let(:status) { double('status', exitstatus: Random.rand(100)) }
  let(:file) { StringIO.new }
  let(:rdiff) do
    RdiffSimple::RdiffBackup.new do |r|
      r.logger = Logger.new file
    end
  end

  before do
    Open3.stub(:capture3).with(args) { ['output', 'error', status] }
  end

  shared_examples "a command" do
    before { subject }

    it 'and returns the exit code' do
      expect(subject).to eq status.exitstatus
    end

    it 'and logs the output' do
      expect(file.string).to match /output/
    end

    it 'and logs any errors' do
      expect(file.string).to match /error/
    end
  end

  describe '#backup' do
    let(:args) { "rdiff-backup --exclude-other-filesystems --verbosity 5 --exclude *.png #{source} #{destination}" }

    subject { rdiff.backup(source, destination, :exclude_other_filesystems, verbosity: 5, exclude: '*.png') }

    it_behaves_like "a command"
  end

  describe '#verify' do
    let(:args) { "rdiff-backup --verify-at-time now #{destination}" }

    subject { rdiff.verify destination }

    it_behaves_like "a command"
  end

  describe '#verify_at_time' do
    let(:args) { "rdiff-backup --verify-at-time now #{destination}" }

    subject { rdiff.verify_at_time destination, 'now' }

    it_behaves_like "a command"
  end
end
