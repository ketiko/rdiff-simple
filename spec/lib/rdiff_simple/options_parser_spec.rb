require 'spec_helper'

describe RdiffSimple::OptionsParser do
  subject { RdiffSimple::OptionsParser.parse(:b, :exclude_other_filesystems, verbosity: 5, exclude: '*.png', r: Date.today) }

  describe '.parse' do
    it 'converts options to long argument format' do
      expect(subject).to match /--verbosity/
    end

    it 'sets value for argument' do
      expect(subject).to match /--verbosity 5/
    end

    it 'converts symbols to dasherized strings' do
      expect(subject).to match /--exclude-other-filesystems/
    end

    it 'handles single letter argument' do
      expect(subject).to match /-b/
    end

    it 'sets value for single letter argument' do
      expect(subject).to match /-r #{Date.today}/
    end
  end
end
