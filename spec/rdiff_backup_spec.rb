require 'spec_helper'

describe "RdiffBackup" do
  subject { RdiffSimple::RdiffBackup.new}

  describe ".process" do
    it "should throw with invalid args" do
      expect{ subject.process() }.to raise_error
    end
  end
end
