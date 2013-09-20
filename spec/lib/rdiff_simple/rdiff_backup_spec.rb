require 'spec_helper'

describe RdiffSimple::RdiffBackup do
  let(:logger) do
    log = double('logger')

    [:info, :error].each do |type|
      allow(log).to receive(type).with(any_args())
    end

    log
  end

  let(:exit_code) { Random.rand(100) }

  subject { RdiffSimple::RdiffBackup.new(logger) }

  describe '#backup' do
    before do
      status =  double('status')
      status.stub(:exitstatus).and_return(exit_code)
      Open3.stub(:capture3).with(any_args()).and_return(['', '', status])
    end

    it 'returns the exit code' do
      expect(subject.backup('', '')).to eq exit_code
    end
  end
end
