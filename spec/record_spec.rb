require 'spec_helper'
require 'dmarc/record'

describe Record do
  context 'by default' do
    it 'has a relaxed DKIM alignment' do
      expect(subject.adkim).to eq('r')
    end

    it 'has a relaxed SPF alignment' do
      expect(subject.aspf).to eq('r')
    end

    it 'has failure reporting options of "0"' do
      expect(subject.fo).to eq('0')
    end

    it 'has an application percentage of 100' do
      expect(subject.pct).to eq(100)
    end

    it 'has an afrf report format' do
      expect(subject.rf).to eq('afrf')
    end

    it 'has a report interval of 1 day' do
      expect(subject.ri).to eq(86400)
    end
  end

  describe '#initialize' do
    let(:parse_tree) do
      [
        {v: 'DMARC1'},
        {p: 'none'},
        {adkim: 'r'},
      ]
    end

    it 'assigns the fields to its properties' do
      rec = described_class.new parse_tree
      expect(rec.v).to eq('DMARC1')
      expect(rec.p).to eq('none')
      expect(rec.adkim).to eq('r')
    end

    it 'gives "sp" the same value as "p" if undefined' do
      rec = described_class.new parse_tree
      expect(rec.sp).to eq('none')
    end
  end
end
