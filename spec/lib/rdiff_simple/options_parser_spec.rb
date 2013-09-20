require 'spec_helper'

describe RdiffSimple::OptionsParser do
  subject { RdiffSimple::OptionsParser.parse('~/Documents', '~/Test', :b, :exclude_other_filesystems, verbosity: 5, exclude: '*.png', r: Date.today) }

  describe '.parse' do
    it 'converts options to long argument format' do
      expect(subject).to match /\s--verbosity\s/
    end

    it 'sets value for argument' do
      expect(subject).to match /\s--verbosity 5\s/
    end

    it 'converts symbols to dasherized strings' do
      expect(subject).to match /\s--exclude-other-filesystems\s/
    end

    it 'handles single letter argument' do
      expect(subject).to match /\A-b\s/
    end

    it 'sets value for single letter argument' do
      expect(subject).to match /\s-r #{Date.today}\s/
    end
  end
end
